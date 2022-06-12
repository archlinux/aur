_uuid="SF8P01"
_app_id="com.retrostudios.DonkeyKongCountryReturns"
_title="Donkey Kong Country Returns"
pkgname=donkey-kong-country-returns
pkgver=1.0
pkgrel=2
pkgdesc="Side-scrolling platform game developed by Retro Studios and published by Nintendo for the Wii console."
arch=('any')
url="https://en.wikipedia.org/wiki/Donkey_Kong_Country_Returns"
depends=('dolphin-emu')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.iso::https://archive.org/download/446f6e6b6579204b6f6e6720436f756e7472792052657475726e73205b2050414c5d/Donkey%20Kong%20Country%20Returns%20%5BPAL%5D.iso"
        "wii-template.desktop"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/1/1f/Donkeykongcountryreturns.jpg")
sha512sums=("74c5505cc852d98c01e48a11d699299a4a756ecd2910be273aa2186b45a2a08770f768d81e72bb5f9d5e4c15dcd6ae1ff65d95c9f189f8900c75e4e6c9596ead"
	    "64deb671d7251f9a97f82eb345799f5df8fa63fa1ebc8c8e1ee0c148af81ecdddfc85900be2957283507adc4fc90e78aef2723ad8b2f6c255d952c0b8ab29aa3"
	    "f714273218ed863aaca62336c1a88a919dc7dc040d125bc75edd5170eed92b4e59d191241ddfdd57a2b6bd19cc395062b720c2e9bda46a0dbe07a3b2193f8884")

prepare() {
  mv wii-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"
}

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.iso" "${_game}/${_uuid}.iso"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
