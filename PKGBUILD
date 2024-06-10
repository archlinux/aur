# Maintainer: Menghuan1918 <menghuan2003 at outlook dot com>

pkgname=doc2xgui-git
_pkgname=Doc2X_GUI
pkgver=0.0.1.r0.g79f00eb
pkgrel=1
pkgdesc="Third Party Doc2X Client"
url="https://github.com/Menghuan1918/Doc2X_GUI"
license=("GPL-3.0-or-later")
depends=("python-imagehash" "python-pillow" "python-pyqt6" "python-pyqt6-sip" "python-pyperclip" "python-requests")
makedepends=("git")
arch=("any")
source=("git+${url}.git" "Doc2XGUI.desktop")
sha256sums=('SKIP'
            '0ce81e5733a5c92fe29d723a1688cba84811c32e96b7ddc8b7531b420af9409f') 

pkgver(){
    cd "${_pkgname}/"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}

package(){
    cd "${_pkgname}/"
    install -d "${pkgdir}/opt/${_pkgname}/"
    cp -r {icon.png,Tools,pdf.png,Clip.py,Doc2X.py,Doc2X_zh.qm} "${pkgdir}/opt/${_pkgname}/"
    install -Dm644 "${srcdir}/Doc2XGUI.desktop" -t "${pkgdir}/usr/share/applications/"
}
