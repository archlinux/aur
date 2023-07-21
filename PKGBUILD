# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-722series'
pkgver='5.30'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Network Adapter X722 Series for Intel® S2600WF'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19223/'
license=('Custom')
source=("https://downloadmirror.intel.com/685619/nvmupdatepackage_wft_wfq_wf0_v${pkgver}.zip")
sha256sums=('5ab8311c7a01db474432c2d3bade300ae5fd3f45dd62ff171b58ce5f23aa893f')

prepare() {
  chmod +x "WFP_v${pkgver}_X722_NVMUpdate_Linux_x64/nvmupdate64e"
  rm -rf "WFP_v${pkgver}_X722_NVMUpdate_Linux_x64/"*{.tar.gz,.pdf}
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "WFP_v${pkgver}_X722_NVMUpdate_Linux_x64" "${pkgdir}/opt/${pkgname}"
}
