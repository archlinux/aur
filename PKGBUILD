# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-pl1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Polish female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Canwe.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Hallo.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Ja.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Komputer.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/See.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/wiewiorka.pho")
sha256sums=('994e5e4719b9f788c88e7aea4d8a13dd0674c6ff6b118c68450c1374ccc83d5c'
            '1e64b5a81a1bd758771efab3d8147881ce306ebe4aa8baf7f4357af573a9ed99'
            '7959bbe24dd7090a8495b978817ad482888cc65b8e29b81f7bee8cf7a9cbf604'
            '5f1b1c0d60630d574957064f113886afc70ed0fad9165f396ec52d1903110a0a'
            '7ebb98e320c9b337bdc9f8b2ff4e712219f74b3f1ccbb39a3c79eaf6ff1e3a99'
            'abbc7dcece5f7b8b87912cee4074426daf513b84d28c1523584480b4d6c04070'
            '80989b3f4d831667eb3de2dcc081bfa69b41f04ea846a756ab04b27e109054d0'
            '4e6dc5c83d8e1939a0f8f1e3864a3c7ac23ff14f7d346bc1111135c202e85b4e'
            'ca81f0c4b58c884b4fd93352bffd3432856aaf403f8ffeffecf898120ba89156'
            'a9a83ccdcaede076e2b5258a42862fed8f64aecb76237ed30f20bba714a8235e')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini Canwe.pho Hallo.pho Ja.pho Komputer.pho See.pho wiewiorka.pho
}
