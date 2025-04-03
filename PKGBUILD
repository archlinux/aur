# Maintainer: Duvet05 <gonzalo.galvezc@pucp.edu.pe>
pkgname=web-blocker-git
pkgver=r20.1f5bd0e
pkgrel=1
pkgdesc="A tool to block unwanted websites using iptables"
arch=('any')
url="https://github.com/Duvet05/web-blocker"
license=('GPL3')
depends=('bash' 'iptables' 'python3' 'python-dnspython')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/web-blocker"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/web-blocker"
    install -Dm755 "web-blocker.sh" "$pkgdir/usr/bin/web-blocker"
    install -Dm755 "web-blocker.py" "$pkgdir/usr/lib/web-blocker/web-blocker.py"
    install -Dm644 "sites.conf" "$pkgdir/etc/web-blocker/sites.conf"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
