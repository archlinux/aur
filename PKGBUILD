# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=nerd-fonts-dejavu-complete
pkgver=2.2.1
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
sha512sums=('2d03d7a8692d5826e9103b04e8bcf6ae0943fbc5a893ceee43e31ec72168c94dcd0bf2592264332e7d229383ac464b2922e14b53dc761574a407f5e095292f1f'
            'fd137e1be01519ceb91cdcd38aad4a3453d6bd390c2ec71a1900acf5d4763b636fa3934524f49e87989548451cce090be8c1b29c7fa73fca0f86714d1827a1a2'
            '8a4ba7bdfe001c350149f75c36efbfcbb948dd4d515fe627224c697b68558046054a6927b9a1f807e65a20482b3203a8f1a2e70b0a7defa9362fa9710114da84'
            'c83a311075c4c52358a9c029802cbfb65c56b6e590193f9216e35f696192487dbc70707dc2996da5a4e76de79081a0a73d8464a87082f43a8d945756d779a844'
            'bb8ee4fe9e821486097f0e0749424e12dfd91e78b650271bd1368db8974f0ff9362b6791a55416f5ef43ed3678874b99348efdcdc45026d5b2ac34fa5d8a85db'
            '6519ea0ca623d19ebd133d875d271d523735008b8510f2cdbbf20beca31e4d62544360f7ebbbc49f0e62df6456ce847921a724971b9261336354722080976d20'
            '79e06decba0613126fa386b3be7866fd91d8a715d235772cb949d0dd0af455eed998593b2605baf9f3dc422c96a52ed80630aadeedcbfa082f47d410c56da410'
            'bd4922c080690d852b9408aab18f66d78fe785fb6df470ccb9c044b6ea2ebc043996de16ddd80421394a49b6c8ee7e4ca45e1658860abc43f9564e09202359d3'
            '941169ae9f04d4d706fead04cc2391c57b681c934f5d646a1444d9a1240ba42500a5ea79ae5d1bb172666f6d48d44d95fa757a5785593088d887736d58f4cc82')

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
