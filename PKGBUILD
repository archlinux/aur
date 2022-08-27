# Maintainer: Blair Bonnett (blair dot bonnett at gmail dot com)

pkgname=nerd-fonts-noto-sans-mono
pkgver=2.2.1
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
  '36f75489495781b317e70482907a0c05f70ed93c642546463d2bb34343de1219'
  '66ba2f785a89d9cab0fc2cad35a248595bffff3f7dcc0b8a41b671120273f765'
  '5232e85d3d1b293d4375babffd148fc0167fb452634e0c7ee9cffd422720aa3b'
  '8e39f569dd017ec34bd0672425b96ccecb48f08e25c76755fd7967f047d33a02'
  '10ddc7f103a08f10543ae2924d0b71ff46429b6c2f31f9de4ca28fdd9f4738df'
  'd279c6efdc872f4eb9dff3df4a10068a35247e7e9fe8b92c212f25933f30c996'
  '1db8a79ebc7ac630ea7f145c5c755bee28b51714b1f14d40916ebce96274a0f4'
  'b35a2766c1d3285619832d8f2a45ad487b041fb8f870fe9b1421a5aacd6b02ba'
  '9c6db13f206f30ca933031b78157c17d8f75bd35105f333ca79eaaf08a71595f'
  'b5d76345c1f98da6254d5e51109e4ac5488029734533fa98abcc7e5e61864207'
  '763de090fcabe75838446c66f510aa39198c0d4f6e0b80272c09518652cc9131'
  'c61b8c88ad99a1cdacbd14ae4fff108f0a27b10ddf61a0c611abeb0a80cfdf20'
  '2bb42b36f3b86d11a3911bdbfe7221a019a5c0d374d6a2eb601582a2a698d533'
  'd2acaac14634bb855025363d4a107b0ac88d56912a5ca50e798ae7c23288c3f8'
  'd2465f33992e507dffaf0bb4f97347bb8847bf85588a10606bff7fffaecc6495'
  '9ce695232ae88541f7a537e2f269755a593529b934f812b4313ee69c48247381'
  '91ec55e19ad50c3a3a35fa40e2d5555711201f6458fc008b3997f0660a017985'
  '79cb64006749794176c7017ecbc293048be94ee1f9212a9ed143c0e59dcf73a8'
  'dfc2dfb06c449f4087b0207b4b59ca37e5073e3b3d7f1ea3a7904d027d0757bd'
  '4fba0b3cb70e840b889c3098305e03ef2e24c104c6c54847dbbf232951a5c1c4'
  'be0dc8b52f4233fc9bf30fd803feec0f5cdce6a51d59c4210314f1273a81b508'
  '2bef486f5ab6315e9776b5121bd1477393e9da69e7d4a6fa1b5645877e196a59'
  '96035318048c5df922e621b1f5d0d1186c1f6cc35e0520bc84536bb8a2b3ea91'
  '9062bfcf0a6ba94451f82e512575fcfcd6b9030d983d210fcecfa06eeffa395e'
  '69aadf4c80870c043ced204fe4fb94b16ccc1238f647396187a7ad1932ea6d41'
  'fc14af00c3e459b128e1f2280442567c24ec0a0950303e149818ca97315671c1'
  'b8fd11401071221fac076d384d4780d5bc2d98fa83ecec977fa83d7937dcef13'
  '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2'
)

package (){
  install -dm0755 "$pkgdir"/usr/share/fonts/TTF
  install -Dm0644 "$srcdir"/*.ttf "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE_OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
