# Maintainer:  chocotan < loli at linux.com>

pkgname='ztoim'
_pkgname='ztoim'
pkgver='8.23.0.21';
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="ZTO BAOHE ${_major}"
arch=('x86_64')
url='https://baohe.zto.com'
license=('custom')
provides=()
_filename=CgRRbWSb07WATnVHBn5OkGX3MTs.AppIma
source=(
  "https://fscdn.zto.com/fs41/M09/8A/36/CgRRbWSb07WATnVHBn5OkGX3MTs.AppIma"
)

md5sums=('3d2dbc3d328568e3a93a8a5518affa8f')
sha256sums=('c2138767b7e66b61edf6003ec1402c9e420237b3e766b1db249ac76c955ad9b3')

options=(!strip)
prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
}


package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
    # Install Exec Script
    ExecScript="#!/bin/sh\nexec /opt/appimages/${_filename} \"\$@\""
    install -dm755 "${pkgdir}/usr/bin"
    echo -e $ExecScript > "${pkgdir}/usr/bin/${_pkgname}"
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
