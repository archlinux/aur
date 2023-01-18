# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=nerd-fonts-dejavu-complete
pkgver=2.3.1
pkgrel=1
pkgdesc="All variants of Nerd-Font-patched DejaVu Sans Mono"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
_raw_base_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}"
_raw_font_url="${_raw_base_url}/patched-fonts/DejaVuSansMono"
license=(MIT)
provides=(ttf-font)
source=(
  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Bold-Nerd-Font-Complete.ttf::${_raw_font_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20Nerd%20Font%20Complete.ttf"
  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Bold-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"

  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Bold-Oblique-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20Nerd%20Font%20Complete%20Mono.ttf"
  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Bold-Oblique-Nerd-Font-Complete.ttf::${_raw_font_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20Nerd%20Font%20Complete.ttf"

  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Oblique-Nerd-Font-Complete.ttf::${_raw_font_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20Nerd%20Font%20Complete.ttf"
  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Oblique-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20Nerd%20Font%20Complete%20Mono.ttf"

  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Nerd-Font-Complete.ttf::${_raw_font_url}/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf"
  "${pkgname}-${pkgver}_DejaVu-Sans-Mono-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"

  "${pkgname}-${pkgver}_LICENSE::${_raw_base_url}/LICENSE"
)
sha512sums=('07647880fc75529325e04ba6d7468f1c99e50571bf17de91263e4ed5983f6664bd404f932c5f81f9a0b1dc39bf8cac1f3b7ae2c68729f3dea70f1b6dbf69e7c8'
            'fb832c88ffa6f7202416b8f26fa3b7aee542098006a292fdd96fc291e17781951749fbd27cc85772e8288fb6aa45b05e145aac57c667af96ed72a0e44d9d2bad'
            '81bd93a117f900a66a53963b6a69705f2eb00aa13bf9c7cd0f4177606e5fd459980ab1b0db6deae06d24a3aa307c8f5c14a4d2fd5edbd5b5878125ab0f22cdd5'
            'e5f08bf3abdfa7b2efc2f09fa030dd895ebebafc671d03946729b41e68d9a4c74efcc55f32319f3f0435914877c1234583668cd49aee079679f489a387132982'
            '622edb87123137a88096c2e195ec98fac38e3f11acfd0edd956c9fdbeb13327b123b0407a1c52df5b4b308d67f4b3a078628b0dfbb80bf4bf2e5d7c4d6baf25d'
            '37c174c1d4c2afa1fc66340e1a6d2c66d1e5900ec44c08d818e301eac0dd44d14ddb59e1f147667e2b72e2c89faf7e8635164d20d1e3ce90ec10681f37c0efd9'
            'fcfdb207148d5908183b29a7de5a3858e2e47b1b54e61afd525789f0c97df9e2e584d985196e6b855ffe5b06a5acb77901453ea8051359947bcba96f4523e4a3'
            'af880fce5ec64b9a7b76fa8dd772c80bf9905a0db4ef07d97c9c90b109b772853937cc11f987b3c37585f9eaf16acdd012c0cd5e6184d0c4ea8787c74c0feb4c'
            '54b3d670b99a1128b32e61078165ddf9823a43dd51ef4f523b58a4d5638180ee57a22d90ce76e8955f50b6b556bc0f7ee32231d6abbb95575ceef7376e61215a')

prepare() {
  mkdir "${srcdir}/${pkgname}-${pkgver}"
  for srcfile in "${srcdir}/${pkgname}-${pkgver}_"*; do
    ln "${srcfile}" "${srcdir}/${pkgname}-${pkgver}/${srcfile#${srcdir}/${pkgname}-${pkgver}_}"
  done
}

package() {
  install -dm0755 "${pkgdir}/usr/share/fonts/TTF"
  install -Dm0644 -t "${pkgdir}/usr/share/fonts/TTF" ${srcdir}/${pkgname}-${pkgver}/*.ttf
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${srcdir}/${pkgname}-${pkgver}/LICENSE
}
