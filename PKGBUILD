# Maintainer: b4g <truesilver92+archlinux.org@gmail.com>

pkgname=chromium-thegreatsuspender
pkgver=v7.1.0
pkgrel=1
pkgdesc='Automatic tab suspension for Chromium'
arch=('any')
url='https://github.com/deanoemcke/thegreatsuspender'
license=('GPL2')
makedepends=('git')
install="chromium-thegreatsuspender.install"

prepare() {
    rm -rf ./*
    git clone --depth 1 --branch \
        "${pkgver}" \
        "https://github.com/deanoemcke/thegreatsuspender.git"
    mv "./thegreatsuspender/src" "${pkgname}"
}

package() {
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${pkgname}" "${pkgdir}/usr/share/"
}
