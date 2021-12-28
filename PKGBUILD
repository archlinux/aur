# Maintainer: Saurabh Kumar Sharma <imesskayesss@protonmail.com>

_appname=cyberdropdownloader
pkgname="${_appname}-bin"
pkgver=2.1.5
pkgrel=2
pkgdesc="Unofficial binary installer for CyberDrop Mass Gallery Downloader"
arch=("x86_64")
depends=('python' 'python-pip')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=("GPL")
options=('!strip')

source=("${_appname}${pkgver}.tar.gz::https://github.com/Jules-WinnfieldX/CyberDropDownloader/archive/refs/tags/${pkgver}.tar.gz"
        "cyberdrop-downloader")
sha512sums=("SKIP"
            "ad1df81d2b36efadd84425a889d66336fbdeba4762373bb3ee3139c3a3639d3b74eb55d24cf4b9c11bc5ad9dbc8d8d3a5dcde0feff21077bde68d9c4fb9f566f")

prepare(){
    pip install -r ${srcdir}/CyberDropDownloader-${pkgver}/requirements.txt
}

package(){
    install -dm755 "${pkgdir}/"{opt/${_appname},usr/bin}
    cp -a ${srcdir}/CyberDropDownloader-${pkgver}/* "${pkgdir}/opt/${_appname}/"
    cp "${srcdir}/cyberdrop-downloader" "${pkgdir}/usr/bin/"
}
