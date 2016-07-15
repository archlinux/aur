# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=gitbook-editor
pkgver=6.0.4
pkgrel=1
pkgdesc="Gitbook Editor - Write and publish books"
arch=('i686' 'x86_64')
url="https://www.gitbook.com/editor/linux"
license=('custom')

source_x86_64=("gitbook-editor-${pkgver}-linux-x64.deb::http://downloads.editor.gitbook.com/download/version/${pkgver}/linux-x64")
source_i686=("gitbook-editor-${pkgver}-linux-ia32.deb::http://downloads.editor.gitbook.com/download/version/${pkgver}/linux-ia32")

md5sums_i686=('fe0ad6fd24110856ffa8fc5d45ab1b10')
md5sums_x86_64=('df3987433807802697a04cf6ccbd3cdf')

prepare() {
    bsdtar -xJf data.tar.xz
}

package() {
    cp --preserve=mode -r {opt,usr} "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/opt/gitbook-editor/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
