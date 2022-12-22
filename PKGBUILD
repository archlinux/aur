# Maintainer: Shen ZhongLi <szl921818@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# mindmaster 中文版

pkgname=mindmaster_cn
_pkgname=MindMaster-10
_softname=mindmaster
pkgver=10.0.8
pkgrel=0
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster" "mindmaster-cn" "mindmaster_en")
replaces=('mindmaster-cn')
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/${_softname}-${pkgver}-${arch}.deb")
sha256sums_x86_64=('c7b84ef751e2bd153f12741892b65d54ac93d70272f9077377622940d799e6a4')
# noextract=("${_softname}-${pkgver}-${arch}.deb")

prepare() {
    bsdtar -xf "${srcdir}/${_softname}-${pkgver}-${arch}.deb" --numeric-owner -C "${srcdir}"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    bsdtar -xf "${srcdir}/data.tar.gz" --numeric-owner -C "${pkgdir}"

    install -dm0755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/${_pkgname}/${_softname}.sh" "${pkgdir}/usr/bin/${_softname}"
}
