# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=eclipse-jcde
pkgver=0.2
pkgrel=1
pkgdesc='Eclipse plugins for the Java Card Development Kit'
url='http://sourceforge.net/projects/eclipse-jcde/'
license=('EPL' 'GPL')
arch=('any')
depends=('java-environment>=6' 'eclipse>=3.6.2' 'java-card-development-kit>=2.2.2')
makedepends=('unzip')
options=('!strip')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.zip")
md5sums=('f1f48c1f58dacfe07d380c1f5d4c7465')
install="$pkgname.install"

package() {
  _dest="${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse"

  cd "${srcdir}"

  ## Plugins
  for _p in plugins/*.jar; do
    install -Dm644 "${_p}" "${_dest}/${_p}"
  done
}

# vim:set ts=2 sw=2 et:
