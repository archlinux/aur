# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Pedro H. Lara Campos <root@pedrohlc.com>
# Thanks at Pedro for this easy to use AUR PKGBUILD I could use!
# As well as archlinuxcn for the original edition of this packages.

pkgname="fabiscafe-keyring"
pkgver="20210503"
pkgrel=2
pkgdesc='Fabiscafe PGP keyring'
arch=('any')
url='https://gitlab.com/fabis_cafe/fabiscafe-keyring'
conflicts=("fcgu-keyring")
provides=("fcgu-keyring=20210308")
replaces=("fcgu-keyring")
license=('GPL')
depends=('archlinux-keyring')
makedepends=(git)
install="fabiscafe-keyring.install"
_commit=2a981729d9fbe513f45a3d88a60be1af017eee92  # tags/20210503^0
source=("git+https://gitlab.com/fabis_cafe/fabiscafe-keyring.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

package_fabiscafe-keyring() {
  install -dm755 "${pkgdir}/usr/share/pacman/keyrings"
  install -m0644 "${srcdir}/${pkgname}/fabiscafe.gpg" \
                    "${srcdir}/${pkgname}/fabiscafe-trusted" \
                    "${srcdir}/${pkgname}/fabiscafe-revoked" \
                    "${pkgdir}/usr/share/pacman/keyrings/"
}
