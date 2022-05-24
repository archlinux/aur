# Maintainer: Pig2014 <18111431031@163.com>

pkgname=paracloud
pkgver=3.5.3
pkgrel=2
pkgdesc="A command line tool to connect to super computers in PARATERA(TM)."
url="https://www.paratera.com"
arch=(x86_64)
license=("custom")
depends=("glibc")
install="${pkgname}.install"
source=("https://www.paratera.com/upload/article/attachment/2021/12/30/0de05bcbde6b4ad8b589a665f2293bc5.zip")
sha256sums=('d49bc140effb41812aa05b10aa3a9a4855873c212c4d723f07ebdf5f4fb5ac35')

check() {
  cd "${srcdir}"
  unzip -t -qq 0de05bcbde6b4ad8b589a665f2293bc5.zip
}

package() {
  cd "${srcdir}"
  #extract required files
  unzip -qq -o 0de05bcbde6b4ad8b589a665f2293bc5.zip
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mv papp_cloud-${pkgver}/papp_cloud_linux_amd64 "${pkgdir}/usr/bin/papp_cloud"
  mv papp_cloud-${pkgver}/passh_linux_amd64 "${pkgdir}/usr/bin/passh"
  mv papp_cloud-${pkgver}/papp_cloud使用手册.pdf "${pkgdir}/usr/share/doc/${pkgname}/papp_cloud_manual_zh_CN.pdf"
  mv papp_cloud-${pkgver}/sccs.yml "${pkgdir}/usr/share/${pkgname}/sccs_sample.yml"
}

