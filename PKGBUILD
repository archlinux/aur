# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=ttf-ubuntu-sans-mono
pkgver=1.100
pkgrel=1
pkgdesc="Ubuntu Sans Mono Font Family"
arch=("any")
url="https://github.com/canonical/Ubuntu-Sans-Mono-fonts"
license=("Ubuntu-font-1.0")
source=("${url}/releases/download/v${pkgver}/Ubuntu-Sans-Mono-fonts-v${pkgver}.zip"
        "https://raw.githubusercontent.com/canonical/Ubuntu-Sans-Mono-fonts/refs/heads/main/LICENCE.txt")
b2sums=('26dcd18c1e6253e5bbd0aae453a037c85491b9d691c672753e389b8e1e0dee7ccc41b799b0f014fea805ef3e78ba7cc8b0d08fd5d0cf6ea9dc0a82d0c725cddf'
        'd96bc83f72177fff834393473d503b3b3718f06eed8c37b0f8add58e254ecf45dcefb171953389a6c4376a000776f87186f68b95588f7a9edd5772dfbf2b13f5')

package() {
    pushd Ubuntu-Sans-Mono-fonts-v"${pkgver}"/fonts/ttf
    for file in *.ttf
    do
        install -Dm644 "$file" "${pkgdir}/usr/share/fonts/ubuntu-sans-mono/$file"
    done
    popd

    install -Dm644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

