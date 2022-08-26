# Maintainer: Blair Bonnett (blair dot bonnett at gmail dot com)

pkgname=nerd-fonts-noto-sans-mono
pkgver=2.2.0
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
  source+=("NotoSansMono-${_font// /-}-Nerd-Font-Complete.ttf::${_base_url}${_font// /%20}%20Nerd%20Font%20Complete.ttf")
done

# OFL is not a standard license, so include that too.
source+=("https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/patched-fonts/Noto/Sans-Mono/complete/LICENSE_OFL.txt")


sha256sums=(
  'bc778d37f444f2731798508027cf62efa4bd130cc9d3ff0b60c2cd5656a884d9'
  '4dded976c626f42a37c692db03aaf0a782c237e9f02c0f4bb8abc3c4d9f8911b'
  '5e88e6f362985fd3c4752a93de1b1ffbbd4cd248281a9cb2ad5ea7c0a38cef70'
  '891934a332bf6e4fab6c64acc86679d41a5abe3d0d8917137c40534bf6780bd6'
  '3e093f7e7b371c1dd6430fbc50ff3d3b8febc7764786ff7a2ff37971751df1a8'
  '2b7b1b994d5fdc2b3c4ed3b080c82eaf6d6010b2f9eb4875d1241793ddad1293'
  'f58e1b69605ae3e84b0d220f249a028fba3754014eaf361e12b026c87152491c'
  '160a2f672f46e4f3d6e26488acced34095e555b11492f17d0a13f836bfbae45c'
  'd1f1233979960feeac08525271b76ac473d427a8253c30187d2ac38db18964c7'
  '6ab475a764b53af5c25f39d02f783d46cde8b76ed741b48a6168f8f697803ec3'
  'b5e20d8d686b7f371e033528f9275e00737231c3dc5b416e10a389703da02e58'
  '74f6c4632e84769676ff5c57e767f03341c19d45fbc8370f60fb3fd1fe42118e'
  '7d29ec1f33a603732adf9bd0c3de97d3b5cc99c7e71b0994958f06d48fe1e081'
  'b4f9f82fba84dd081869e70d4da6e56160b0ddc45f94c6ec135376a9feb0cdc6'
  '2da6bcfaf8761d451bb2343c0c7da6807e268abb8732cbf7daf538af0996ce57'
  '3b5f52c35c8cf5ed57a391a8dbc3bd198b74f06c5d5845f17ca228dfda9c13f1'
  'b95a00a831d1a18b9add75941da5222d24d53a5b3453081c98a3a3c45bdbcf6c'
  '8e1ab6d5cbda8a378ff18aeb84b16ffdbcbd4f62b421b49023b6ff8e4c113e0a'
  '912486decc051285e18a864d5acc4f64f289ebf290a4ac9c6bbdfb958b599edb'
  '8b4a67c0c2b2b9cf39327ef114deec9dab666645e0369673c90d95c22dfc13b6'
  'edf3e44d9969f8b442a19c9bfafd07ef920a6ccab926e1d13cb3719865df39a5'
  '09bbf21f3c05892ccd1a8f61d516d05567fa53f8ee108b038d6f5babd6ac2f78'
  'e5e0244532bb43a5c5b64aefdfbd6bbd723932ce78b3e9b339d5c1f4083df13a'
  '3dc6deaf9bb99166c4c40831884a01f3395fc974306db4b707db3c0aa7eff1a1'
  'cae232241c59991da1e9929fba8861078b4e3fc88f5742857554418cc1b6bf8a'
  'f21fd39c173eb26ac9ae1baa05de316cfa4f37778a0ec6289251ec9f24a39e0b'
  'ba14528a2126206c2b9aa11f8d9ab5ad7fb88d8cb3efa5dec5da5732ce96599a'
  '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2'
)

package (){
  install -dm0755 "$pkgdir"/usr/share/fonts/TTF
  install -Dm0644 "$srcdir"/*.ttf "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE_OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
