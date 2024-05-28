# Maintainer: kompowiec2 <diasp@o2.pl>
pkgname=ai-horde-worker-regen-git
pkgver=7.0.1
pkgdesc="generating images and text using your GPU and earning kudos."
arch=('x86_64')
url="https://github.com/Haidra-Org/horde-worker-reGen"
license=('AGPLv3')
depends=('python' 'python-pip' 'git')
makedepends=('git' 'python-virtualenv')
source=("git+https://github.com/Haidra-Org/horde-worker-reGen.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/horde-worker-reGen"
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
}

package() {
    cd "$srcdir/horde-worker-reGen"
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r . "$pkgdir/usr/share/$pkgname"
    install -Dm755 "$srcdir/horde-worker-reGen/horde-bridge.sh" "$pkgdir/usr/bin/ai-horde-worker-regen"
}

# vim:set ts=2 sw=2 et:

