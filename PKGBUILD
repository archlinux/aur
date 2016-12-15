# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=fromscratch-bin
_binname=FromScratch
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple but smart note-taking app"
arch=('i686' 'x86_64')
url="https://fromscratch.rocks"
license=('MIT')
provides=('fromscratch')
conflicts=('fromscratch')
source=("https://raw.githubusercontent.com/Kilian/${_binname}/v${pkgver}/LICENSE"
        "https://raw.githubusercontent.com/Kilian/${_binname}/v${pkgver}/app/assets/img/icon.png"
        "${_binname,,}.desktop")
source_i686=("https://github.com/Kilian/${_binname}/releases/download/v${pkgver}/${_binname}-linux-ia32-${pkgver}.zip")
source_x86_64=("https://github.com/Kilian/${_binname}/releases/download/v${pkgver}/${_binname}-linux-x64-${pkgver}.zip")
sha256sums=('8393225b48095d8ba6e01e1e78f37494843c6db929dacf87457b4ca1616deab8'
            '6588f5c6eca8ba660ac66977a904c0c6e2bfcdde94593c267d918fee0043d796'
            'cc984639b604c8f442b28b5bfb8481a61634fcc48e06c460036694ee47c0ed54')
sha256sums_i686=('5aa69cc756f1e5cd41237015ea8d34219ce8c1e7ea51dcfc02f5a4601b5d3203')
sha256sums_x86_64=('2d1ae683e13670ff37806f69637f6c0961069f77d48215752b021b9133fe6e21')

package() {
  cd "${srcdir}/${_binname}-linux-"*[24]

  install -d "${pkgdir}/opt/${_binname,,}"
  cp -ra * "${pkgdir}/opt/${_binname,,}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_binname,,}/${_binname}" "${pkgdir}/usr/bin/${_binname,,}"

  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${_binname,,}"
  install -Dm644 ../icon.png "${pkgdir}/usr/share/pixmaps/${_binname,,}.png"
  install -Dm644 "../${_binname,,}.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
