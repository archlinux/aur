# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Valdis Vitolins <valdis.vitolins@odo.lv>

pkgname=mbrola-voices-ar1
epoch=1
pkgver=16.fe05a0c
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=fe05a0ccef6a941207fd6aaad0b31294a1f93a51
pkgdesc="An Arabic male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('LicenseRef-custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/assalam.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/participate.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/player.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/staying.pho")
sha256sums=('4bf5dc3769c1e9431e80dd59e5014dc524c34db0797769062e379fbc4faac4b1'
            '053ea21f94ddc8c9705496e92618052cde9111bd11f568553d78ce4651e4320f'
            '49ff1ca6cb2ef383623db54aad96a60b02b862394d851abca0e514ab13065ad8'
            '80c2ce606110cfa8960ef91fe0ea002ceae0059e8b7a7f3bc6d55a8fd81bc1d4'
            '87d86eced861c8e732941b19b4c2f8b605d857ebd3606237a948d472b074b3e1'
            '73501601f19d0fa019b62fc2e3c482b8b21ba049e7a6ca99cc5d5c202d279912'
            '8130e436c84e5812881fd6753c126a9c8d6f70186bc2d3707936ae37a938cc12'
            '615a6eab519f8ead8e6a61704e1b6cc7ecff9c4c3a2370454d24ab1df6ace8f7')

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
    assalam.pho mbroli.ini participate.pho player.pho staying.pho
}
