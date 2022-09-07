# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=nerd-fonts-dejavu-complete
pkgver=2.2.2
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
sha512sums=('041a79b61aa033da2ac03809fdd398392394d65e83ca7c34a62fdbf5405fd648382b9c5bed94c415d2d3e2b092eb8f7c632ce160a98799e32ef794e49fe6192b'
            'e6cc44d36e4e2af212b72344cc1a0c4495b6068db0fea4e0d8d9fd6ce6ed1641d0fed2e67d07bc3298f775ec04e5dbb8a5ac2e107ad81f16b6c49a82a3e81389'
            '921a4d914b3bbe783daaacf6a85904ca6dacae1b957bd0645b229a6e5a7ef453fd12fd0c4bc99a3d73c64aaa5c969f26cbc50fb5f630877bcd200eb0bf64777c'
            'a094367a9e24f5eff3835e111b2da34e4e65e946f44b25a45b7d3936d28f4f775182c6f89169fe7ea33e1f6cb3249403519ae0b514471be33d929f02423ac0be'
            '36e8a33aee5b6534a949a3cbe323d0f965e67a1723ec0d1288388aa48fcb1d7a5c128d2eb9c0d570d94db25905962c1e371d7935fb425c3304ee41cadc3082e4'
            'd1b3e74f522538ee0df823c87a5e6035435219a2a251e4a1b3746604615ffc75c6c531a59020c2974441421e62a973a4ff22b7e79181477ed5759dedb76f6f06'
            '4c6edf00bdd0fe59ff075bfda1c0151696638693a02f7e01d219dabae5727b6c352b19fb3899ae79d025280b67678964f7076cb27726361f991ac1008ee6f21c'
            'a5b0861cae643252aa8c985dfacf3550d441ea7dad3c2b9804c4eafb1363592d920e748726ac82bd6f233b90e1288e1b054a29f34501de33c56932003785e55d'
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
