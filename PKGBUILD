# Maintainer: Shen ZhongLi <szl921818@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# mindmaster 中文版

pkgbase=mindmaster_cn
pkgname=mindmaster
_pkgname=MindMaster-10
pkgver=10.8.0
pkgrel=0
arch=('x86_64')
options=(!strip)
depends=()
makedepends=(libarchive)
provides=()
conflicts=()
replaces=()
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
# source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/${_softname}-${pkgver}-${arch}.deb")
source_x86_64=("${pkgname}-${pkgver}-${arch}.deb::https://cc-download.edrawsoft.cn/${pkgname}_full5420.deb")
sha256sums_x86_64=('3f1d325124826ab7e54a04b45354b0d4685245e653e6829936f187d55fccf659')
noextract=("${pkgname}-${pkgver}-${arch}.deb")

prepare() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-${arch}.deb" --numeric-owner -C "${srcdir}"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C "${pkgdir}"

    install -dm0755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/${_pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
