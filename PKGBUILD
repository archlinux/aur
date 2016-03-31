# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=gitbook-editor
pkgver=5.0.5
pkgrel=1
pkgdesc="Gitbook Editor - Write and publish books"
arch=('i686' 'x86_64')
url="https://www.gitbook.com/editor/linux"
license=('custom')

source_x86_64=("gitbook-editor-${pkgver}-linux-x64.deb::http://downloads.editor.gitbook.com/download/version/${pkgver}/linux-x64")
source_i686=("gitbook-editor-${pkgver}-linux-ia32.deb::http://downloads.editor.gitbook.com/download/version/${pkgver}/linux-ia32")

sha256sums_x86_64=('576ea0cec4370aafbe4ccdaf164a0551e531078f6ac30bbb7b9d074a9fc8e390')
sha256sums_i686=('00a74ca22ea7a1f78cacdbe241c45a8e60503f023c8221ebfe66c57c41d550fe')

prepare() {
    bsdtar -xJf data.tar.xz
}

package() {
    cp --preserve=mode -r {opt,usr} "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/opt/gitbook-editor/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
