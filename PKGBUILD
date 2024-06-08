# Maintainer: Vorschreibung <vorschreibung@gmail.com>
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=noesis-bin
_pkgname=noesis
pkgver=4.473
pkgrel=2
pkgdesc="Noesis is a tool for previewing and converting between hundreds of model, image, and animation formats."
arch=('x86_64')
url="https://richwhitehouse.com/index.php?content=inc_projects.php&showproject=91"
license=('proprietary')
depends=(wine)
provides=(noesis)

source=("https://www.richwhitehouse.com/filemirror/noesisv4473.zip" "noesis.sh")
sha512sums=('8bb13699eae2bf1c3f0c3b71a00cb9daed6ad13f4df7089bed6541ffb5af50b817945a637ffb42f474129e6164589700c1790aafa03eaf0d5a3ef5ad50d616b0' 'SKIP')

package() {
    cd "${srcdir}"

    mkdir -p   "${pkgdir}/opt/${_pkgname}/"
    cp -RL "." "${pkgdir}/opt/${_pkgname}/"
    rm "${pkgdir}/opt/${_pkgname}/"{Noesis.exe,noesis*zip}

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/noesis/noesis.sh" "${pkgdir}/usr/bin/noesis"
}

# vim:set ft=sh syn=sh ts=4 sw=4 et:
