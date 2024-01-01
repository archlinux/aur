# Maintainer: kmz <valesail7@gmail.com>
pkgname=kd
pkgver=v0.0.3
pkgrel=1
pkgdesc='a command-line dictionary'
arch=('x86_64')
url='https://github.com/Karmenzind/kd'
license=('MIT')
# 'kd::http://localhost:8901/kd_linux_amd64'

source=(
    'https://github.com/Karmenzind/kd/releases/latest/download/kd_linux_amd64'
    'kd.go::https://raw.githubusercontent.com/Karmenzind/kd/main/cmd/kd.go'
)
sha256sums=('SKIP' 'SKIP')

# sha256sums=('75b450280572bdc340a5eac682ea7320776db78e378b5f0bd414a9f3538ee654' 'SKIP')

pkgver() {
    cat ${srcdir}/kd.go | grep 'var VERSION' | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
    # git describe --long --abbrev=7 | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
}

package() {
    install -Dm744 "${srcdir}/kd" "${pkgdir}/usr/local/bin/kd"
}
