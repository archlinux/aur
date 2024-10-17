# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: SoftwareRat <chenxiaolong@cxl.epac.to>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname='ubuntu-wallpapers'
pkgver=24.10.3
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
sha512sums=('aef3f0b963a10a1de8a3f1ae48c38be56b05c703aed1c8dba8bf14842c278e20f6027c1e7b166ac757050f6108d0b8e4b32276f1793062d4c85815283d20462a')

package() {
  cd "${pkgname}_${pkgver}.orig"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dvm644 'debian/copyright' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
