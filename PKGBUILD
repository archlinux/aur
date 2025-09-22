# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Valdis Vitolins <valdis.vitolins@odo.lv>

pkgname=mbrola-voices-es3
pkgver=16.fe05a0c
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=fe05a0ccef6a941207fd6aaad0b31294a1f93a51
pkgdesc="A Spanish male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('LicenseRef-custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/Holaabuelita.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/blablebliblublableblu.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/cuentaconello.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/estafuncionando!.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/estafuncionando.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/laverdadesquemetrabounpoco.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/loseesladeemilia.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/muybientambiengracias!.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/queestoyunpoconerviosa.pho")
sha256sums=('c098cb7e7c5f43b508d73811dc980db261df02cf53720a12a8eb761775b71790'
            '851eb63761c3381e1059e9fb126d8b83e2f922b3cd3635041a3c735e63dd3527'
            '2e985d7a6eb3cc6afac9900220b674dc5ce4f0c1def4ae82587af2fe6aa6ac94'
            '3d6b6e2862efe14b569b57a49c6a745ee68b74445e0784a5638d3a2a8e1bcdb3'
            '8804ae60a221f56e9d2004183cca53745b0b2544812075f868f2da8535d32b2d'
            'dd727fd694ca5122ca4921e67cc978b9ed910bdc755a1be7bd3135bc5af5db3c'
            '32df59acb7db35823d9f06eb33a3955deccd9ce8a8862801fcf21264e34966f9'
            '58f12e135ecbb65e5d66b2515732f264fa27a823fbb6baea8994e9ae4e5e32c2'
            'e972caa66ed4040fcdee22822601ef1788961f231b944ba171f9c78cb51bdfb9'
            '3e4f9af5833134f850b26d5f55eb6facd02dece6e2a6f30c5fbb0e6dc0cde81d'
            '00b495773419c2298768cb39081c4c8d32f1ff4d42e1d7ed4a45df9a7898f464'
            '3bf508bb32fe984e3b730599ff47b8fe9ead797082315b152421357a9f19812d')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    "${srcdir}"/*.pho
}
