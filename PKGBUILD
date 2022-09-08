#!/usr/bin/bash
# Maintainer: Blair Bonnett (blair dot bonnett at gmail dot com)

pkgname=nerd-fonts-noto-sans-mono
pkgver=2.2.2
pkgrel=1
pkgdesc="Standard variants of Noto Sans Mono patched with Nerd Fonts."
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('OFL')

# Base fonts we want to include.
_base_fonts=(
  'Black'
  'Bold'
  'ExtraBold'
  'ExtraLight'
  'Light'
  'Medium'
  'Regular'
  'SemiBold'
  'Thin'
)

# Expand to include normal, Condensed, ExtraCondensed and SemiCondensed versions.
_fonts=()
for _font in "${_base_fonts[@]}"; do
  _fonts+=("$_font")
  if [ "$_font" = "Regular" ]; then
    _fonts+=('Condensed' 'ExtraCondensed' 'SemiCondensed')
  else
    _fonts+=("Condensed $_font" "ExtraCondensed $_font" "SemiCondensed $_font")
  fi
done

# Generate a source entry for each version.
source=()
_base_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/patched-fonts/Noto/Sans-Mono/complete/Noto%20Sans%20Mono%20"
for _font in "${_fonts[@]}"; do
  source+=("NotoSansMono-v${pkgver}-${_font// /-}-Nerd-Font-Complete.ttf::${_base_url}${_font// /%20}%20Nerd%20Font%20Complete.ttf")
done

# OFL is not a standard license, so include that too.
source+=("https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/patched-fonts/Noto/Sans-Mono/complete/LICENSE_OFL.txt")


sha256sums=(
  '60bb03550331efa4027f4c577b53bfb71a49a7583e0794441bbfdb7ac4b38abc'
  '46c21c3adaa4b972cdb23d6dece87974fdfadc4f3f35956bd84a244e1310a134'
  '4245f6e327b1d022934cb9180caa5e1ed45b1a4797b27cd9e55838a825a2cf50'
  '4378e47cd9c67991407d77c2553e8997f25f0715405f2bb7a27c4e6208831239'
  'a91fb0d879f131c8bcade63427ba5b6f25ce6542177a4f090dcb4bb6d168b108'
  '1b189f03743fb9b1260105a7c0758dda7d0df40bf1e5b906c8badf4b8f93348c'
  '1029f4001c3280bdd2020513553c07ab3f4a59b96766bf413d9dc4092f4d5ce6'
  '06613371f83f9a3c93e478046b3800a41da0972eca62d3be1c3bd87937ea948d'
  'f90703b71e10205a1e53597e9e14da95063c47e252d4d1d8c6511d021ff17dc8'
  '2256c4fa845c3c19afdd3457b693221c4b2e0819b51d8d268724cbc82ef7d5ee'
  '2d308857bfbc9e7bb9a75f36fa3f99c08b899725059a65390206da5c3cbb3e42'
  'b35c434cb6e42d4b6cef5475209e84d00a3a55d03fc28a7040ad8a5c9f88db2e'
  'bba196b5c83a5d574dc61c09b157d778d70b30f8d2bd471d576e17616b4648c6'
  '03e21d3376ac73db7a5b15fef0e2e4a6492299ba23d30cb2bb247ae33b014995'
  'dbc99d75a5f1a9827b89afc5ce53c23f2f7f87434270d69c768c513e920e09d6'
  'a1903192e8c430d90fc3d18759d840c9b4870b281fe44448ba8d7073b12e34fc'
  'd37a63cee953f80825d79f468c4f0b11334d04f95b16e5570d99bba2104fa819'
  '10939cc893bc9d91ec84aa2ca12c966a29a78af8ff1347cf14968a222fecceba'
  'a71218e63ae95b956009da86dbc1341efa08097f0a36a43ef0c5eb2c4bdd06d3'
  'b84ad92fcd9bdc6fa7ea2c8e37f4d89a759b27994c9b70835c7fd5f1cafa9857'
  'df07f1ff954df66c2d7b24cf74425612850fe596966dfbb8e0784fc806366fa6'
  '7f0402ce0d7095af6828526cd4d1177ddfc0e7417f6924645a92b6740eba82b7'
  'f73b366af8f9ed59f8915c64af9e2ac403215253681843679989976eaebfdf3b'
  '3b62218897eeb82fb5dfbe4a89083438d894240d2480b95d4ac984c0acf0fd1c'
  '8b77f12e9ffafd4d3b2a7efeb877910b3b77cc1a140d4e273e28608faf078611'
  'f87fd14d332d5f68fa52f35637ae08c3d732391ba7ecfa62d5df059c676768a1'
  'a37a5c481d90e657095df60e2bbfae45437ffe6b1765d0886df783acfeddd262'
  '4cd9ed90075679c1ebf1e4542dfc94dd81c2ae304595e734cd4fa2182d7cea45'
  'f7027b15b3749c234fd85ba81d2fc675b0309313605ab1895f75b5de841aa5b4'
  '38a43fea7a48783c7b98b3f1d501b1ade4b7c94bfcf403d2e4f2f6ce5c7537f6'
  '3c753ee8c77b425bb9b08c2cf804de20e2f038c09883c93b93b5b8e7e7d61757'
  '9615b04fad9a53bef17efe8353b22e2fe704d0c688e48e24bfd942f6fa8038fb'
  '2d271c259beb04fa3e4375b0264c9019968f36a4e83b24d2bd9a1e60b0736889'
  '6bad769ace521b6944de9482f5f27028b594a7534f0e289dbe4a19b77853db86'
  '5897c7ea1757fed775a3f630b98baae440e672cb93a7a0a4fc74d4b9ac2a7785'
  'b57620c4546a6bad89feddda5766c9ebced93ad21014dacb247887f752da1b38'
  '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2'
)

package (){
  install -dm0755 "$pkgdir"/usr/share/fonts/TTF

  # Install each font, stripping out the package version.
  local _ttf
  for _ttf in "$srcdir"/NotoSansMono-v"$pkgver"-*.ttf; do
    local _dest="${_ttf##*/}"
    _dest="${pkgdir}/usr/share/fonts/TTF/${_dest/-v${pkgver}/}"
    install -Dm0644 "$_ttf" "$_dest"
  done

  install -Dm644 LICENSE_OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
