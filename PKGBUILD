# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Pedro H. Lara Campos <root@pedrohlc.com>
# Thanks at Pedro for this easy to use AUR PKGBUILD I could use!
# As well as archlinuxcn for the original edition of this packages.

pkgname="fcgu-keyring"
pkgver="20210308"
pkgrel=1
pkgdesc='FCGU PGP keyring'
arch=('any')
url='https://gitlab.com/fabis_cafe/fcgu-keyring'
license=('GPL')
depends=('archlinux-keyring')
makedepends=(git)
install="fcgu-keyring.install"
_commit=71814796bd77eedd603c99df3d33281b97aee178  # tags/20210308^0
source=("git+https://gitlab.com/fabis_cafe/fcgu-keyring.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

package_fcgu-keyring() {
  install -dm755 "${pkgdir}/usr/share/pacman/keyrings"
  install -m0644 "${srcdir}/${pkgname}/fcgu.gpg" \
                    "${srcdir}/${pkgname}/fcgu-trusted" \
                    "${srcdir}/${pkgname}/fcgu-revoked" \
                    "${pkgdir}/usr/share/pacman/keyrings/"
}
