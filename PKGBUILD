# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-ro1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Romanian male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/sampa.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/bon.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/bonjour.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/ceserait.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/chante.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/coup.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/jaiete.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mavoix.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrola.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/nouspouvons.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/romania.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/tagada.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/test.pho")
sha256sums=('5a0e8d89c3d0e163d620385b291a223eb831abaa7b6856fcf1b57096c4e57eb7'
            'd9836a5f798dc3563e02c30b2a4318cd5a2ff5ac6d313d7f8db9eb92cf9eb353'
            '840cfbde0872009c2e8977ce4aaa724ac031adddc575ffe6769d7e9a16448823'
            'adbb003ad9f72d3e57babca914851c4290fff9cf97d512c7fb8e483210c4785a'
            'de5e7dcbb747d57524155db41c934927bc00b54814b5483a26ec127050c72c66'
            'a5a22bb4e093d7d263a0621b0791092e83eff93b13b4075c1ea712eec85a4809'
            'c672c163924e8634a81a634bb9d375e7fa9fbc4740cb2c27991f2fdc4d50d4a9'
            '08d3a39923494825ef678c7f7fb3415b6c56bb1c0359545c203687a208993d77'
            'e00a3d4763846a223dce77a6ad3d6b4c7018d276c2529a8627c462fc4d43e302'
            '25a8dfdd9d917f6d31753e6fa755c74a8615044e5072ed8f06333a9b2d4e6ee4'
            'f87452b553be417391c8e058fb9bac1716d3eb10010d569c1e46b9759fc70de4'
            '66aa272e657f93b8d3c0550cffed216c3be3915e4fae9c504e59f4578e4a6555'
            '4b5b9246adf70fe528bb73fb185617087b0a4ddbe72ceb849d9a8269d82560e8'
            'cab0c7abf51d7679b2c2dc1fce19f6ebf7450cffea02b4aed3901a983dab4b2f'
            '5f85d9f945cc4ff0251f4a12a29189ff4a087e0ce37a3309d28b37da1a10c4cc'
            '6d2d96e1d1db0aa501639067e359974cf8946b40c154f1aaa185e42e3847e50c'
            '4ff63b6bd024196bf4e21ab42fa63f0abe8d8b76885bf69e7a7eee1d478441d7')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt sampa.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    mbroli.ini bon.pho bonjour.pho ceserait.pho chante.pho coup.pho \
    jaiete.pho mavoix.pho mbrola.pho nouspouvons.pho romania.pho tagada.pho \
    test.pho
}
