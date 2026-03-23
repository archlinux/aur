# Maintainer: Kaden Frisk <kaden@queercoded.lgbt>
# Upstream: https://github.com/original-author/repo

pkgname=agelessd-flagrant
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hook wrapper for the Ageless Linux setup script, flagrant edition."
url="https://agelesslinux.org/"
arch=('any')
license=('Unlicense')
depends=('bash' 'systemd')
optdepends=('python: merge existing /etc/userdb/*.user JSON records safely')
install=agelessd-flagrant.install
source=('become-ageless.sh' 'agelessd-flagrant.install' 'updates.hook')
sha256sums=('547d509c756f9a92da63ee60168f9052b56e1100d3c44443569e5d66881d49ee'
            '4acfc28644612e2d9d782148395fa68cc496a83a3a8e97344402e64afb2b71b4'
            'cbf8981b1f92b766d3a33e57a60e15499be7b1ba1e33241743ed8336aff690dd')

package() {
    install -Dm755 "$srcdir/become-ageless.sh" "$pkgdir/usr/bin/become-ageless"
    install -Dm644 "$srcdir/updates.hook" \
        "$pkgdir/usr/share/libalpm/hooks/agelessd-updates.hook"
}
