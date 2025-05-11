# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=ttf-ubuntu-sans-mono
pkgver=1.006
pkgrel=1
pkgdesc="Ubuntu Sans Mono Font Family"
arch=("any")
url="https://github.com/canonical/Ubuntu-Sans-Mono-fonts"
license=("Ubuntu-font-1.0")
source=("${url}/releases/download/v${pkgver}/UbuntuSansMono-fonts-${pkgver}.zip"
        "https://raw.githubusercontent.com/canonical/Ubuntu-Sans-Mono-fonts/refs/heads/main/LICENCE.txt")
b2sums=('9f8423df1f651619e7c52720d5fa8e385b7233021d97783d6c450e4e6a627beb3e106704cb6c5fb4bce0e2e28eb544e75ea4a298d1a03abdcfd670e792d9f019'
        'd96bc83f72177fff834393473d503b3b3718f06eed8c37b0f8add58e254ecf45dcefb171953389a6c4376a000776f87186f68b95588f7a9edd5772dfbf2b13f5')

package() {
    pushd UbuntuSansMono-fonts-${pkgver}/otf
    for file in *.otf
    do
        install -Dm644 "$file" "${pkgdir}/usr/share/fonts/ubuntu-sans-mono/$file"
    done
    popd

    install -Dm644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

