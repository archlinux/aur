# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>

pkgname='xubuntu-community-artwork'
pkgver=22.04.0
pkgrel=1
pkgdesc='Xubuntu community wallpapers'
arch=('any')
url='https://launchpad.net/xubuntu-community-artwork'
_pool_url='http://archive.ubuntu.com/ubuntu/pool/universe'
license=('custom')
# http://archive.ubuntu.com/ubuntu/pool/universe/x/xubuntu-community-artwork/
source=("${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b5d2ebb327625f2b7461bae7c29ceb438620e381305eb2b9531ef61e094773c2')

package() {
  cd "${pkgname}"
  install -Dvm644 "usr/share/xfce4/backdrops/"*.{'jpg','png'} -t "${pkgdir}/usr/share/backgrounds/xfce"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
