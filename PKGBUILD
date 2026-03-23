# Maintainer: Kaden Frisk <kaden@queercoded.lgbt>
# Upstream: https://github.com/original-author/repo

pkgname=agelessd
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hook wrapper for the Ageless Linux setup script"
url="https://agelesslinux.org/"
arch=('any')
license=('Unlicense')
depends=('bash' 'systemd')
optdepends=('python: merge existing /etc/userdb/*.user JSON records safely')
install=agelessd.install
source=('become-ageless.sh' 'agelessd.install' 'updates.hook')
sha256sums=('547d509c756f9a92da63ee60168f9052b56e1100d3c44443569e5d66881d49ee'
            'e3ffb46a357115089455a473d33beb678deb37769d7e57256e19b46037ccf5f5'
            '38d3f19630dec9e7eaae2bc817c4398c5dd3fce854316cac6386c6ed0a99e30f')

package() {
    install -Dm755 "$srcdir/become-ageless.sh" "$pkgdir/usr/bin/become-ageless"
    install -Dm644 "$srcdir/updates.hook" \
        "$pkgdir/usr/share/libalpm/hooks/agelessd-updates.hook"
}
