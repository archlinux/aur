# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: SoftwareRat <chenxiaolong@cxl.epac.to>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname='ubuntu-wallpapers'
pkgver=25.04.2
pkgrel=1
pkgdesc='The default Wallpapers for Ubuntu'
arch=('any')
url='https://launchpad.net/ubuntu-wallpapers'
_pool_url='http://archive.ubuntu.com/ubuntu/pool/main'
license=('custom')
makedepends=('python-distutils-extra' 'python-setuptools')

# https://packages.ubuntu.com/source/ubuntu-wallpapers
# http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers/
source=(
  "${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
)
sha512sums=('4ebb839bb451cccd875593f7b10ef5c0bb16e89266c55e9f1800f1294a923c5ec31af2debb0423a197f1f24029ab78cbce318d263265614ca0fc78607074d530')

prepare() {
  sed -e 's|version = version,|version = "'"${pkgver}"'",|' -i ubuntu-wallpapers-25.04.2/setup.py
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
