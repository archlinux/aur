# Maintainer: Shen ZhongLi <szl921818@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# mindmaster 中文版

pkgname=mindmaster_cn
_pkgname=MindMaster-10
_softname=mindmaster
pkgver=10.5.4
pkgrel=0
arch=('x86_64')
options=(!strip)
depends=()
makedepends=(libarchive)
provides=(mindmaster)
conflicts=("mindmaster" "mindmaster-cn" "mindmaster_en")
replaces=('mindmaster-cn')
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
# source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/${_softname}-${pkgver}-${arch}.deb")
source_x86_64=("${pkgname}-${pkgver}-${arch}.deb::https://cc-download.edrawsoft.cn/${pkgname}_full5420.deb")
sha256sums_x86_64=('dd50ec7a6fb4a4cf01a7c2fd69f39d5f46821343b40437ad87c74a52f6ea97e2')
noextract=("${pkgname}-${pkgver}-${arch}.deb")

prepare() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-${arch}.deb" --numeric-owner -C "${srcdir}"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C "${pkgdir}"

    install -dm0755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/${_pkgname}/${_softname}.sh" "${pkgdir}/usr/bin/${_softname}"
}
