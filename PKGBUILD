pkgname=com.bytedance.feishu
pkgver=4.2.0_3
pkgrel=1
pkgdesc="Empowering teams by messenger, Meetings, calendar, docs, and emails. It's all in one place."
arch=('x86_64')
url="https://www.feishu.cn"
license=('unknown')
depends=('nss' 'libx11' 'libxcb' 'libxext' 'wget' 'xdg-utils')
makedepends=()
optdepends=()
source=('local://signed_com.bytedance.feishu_4.2.0-3_amd64.deb')
sha256sums=('32699ff7ccd6f20ac31c23635c747dde72090fdc794de122119ea3063f9f65e0')

package() {
  cd ${pkgdir}
  tar xvf ${srcdir}/data.tar.xz
  install -d usr/share
  mv opt/apps/${pkgname}/entries/* usr/share
  rmdir opt/apps/${pkgname}/entries
  install -d usr/bin
  ln -s /opt/apps/${pkgname}/files/${pkgname} usr/bin/${pkgname}
}
