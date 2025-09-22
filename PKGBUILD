# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Valdis Vitolins <valdis.vitolins@odo.lv>

pkgname=mbrola-voices-cz1
epoch=1
pkgver=16.fe05a0c
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=fe05a0ccef6a941207fd6aaad0b31294a1f93a51
pkgdesc="A Czech female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('LicenseRef-custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/jedna.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/pokud1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/tojsou1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/vojvoda2.pho")
sha256sums=('1e2f577c35f7a13629087c92b58679c27a2e1b04bd7700805c6094e814ee182e'
            '268dc3a51fa73f39ceda7956c350e7fc9352c568c87d336cd32314daee023b9a'
            'c4b3157c116d96e7cd7bcf25f07ec878c60f4f751e369eeb56510c9d234a85d4'
            '2a4b6a2c124885b2b4cdf4e9bf016a05fd499974a8faf2df86d37a2f8a065808'
            '3daf60d9bf1c4a8dd207a011aed50948a1e05d7dd0185a58abd574f1bf0a6084'
            'aa36ce4db8223d598222f876fea7f8c35005968158e3c1246447a5a726dec698'
            '67e816cd690bf4a1cf5dc490575e69d3b503aedab6d576748651933d367168c5')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    "${srcdir}"/*.pho
}
