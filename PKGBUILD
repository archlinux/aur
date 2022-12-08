# Maintainer: Pig2014 <cattysteve89265@163.com>

pkgname=paracloud
pkgver=3.6.5
pkgrel=1
pkgdesc="A command line tool to connect to super computers in PARATERA(TM)."
url="https://www.paratera.com"
arch=(x86_64)
license=("custom")
depends=("glibc")
install="${pkgname}.install"
source=("paracloud.zip::https://www.paratera.com/upload/article/attachment/2022/07/18/d30d33bde9dc443f96b297ad8d84153a.zip")
sha256sums=('fa83d6e59d27262f62eed3190b92b8da223476eafdb301aee324c25f30a4960f')

check() {
  cd "${srcdir}"
  unzip -t -qq paracloud.zip
}

package() {
  cd "${srcdir}"
  #extract required files
  unzip -qq -o paracloud.zip
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mv papp_cloud-${pkgver}/papp_cloud_linux_amd64 "${pkgdir}/usr/bin/papp_cloud"
  mv papp_cloud-${pkgver}/passh_linux_amd64 "${pkgdir}/usr/bin/passh"
  mv papp_cloud-${pkgver}/papp_cloud使用手册.pdf "${pkgdir}/usr/share/doc/${pkgname}/papp_cloud_manual_zh_CN.pdf"
  mv papp_cloud-${pkgver}/sccs.yml "${pkgdir}/usr/share/${pkgname}/sccs_sample.yml"
}

