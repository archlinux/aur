# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=mbrola-voices-cn1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="Mandarin Chinese female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/License.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Jasmine.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Message.pho"
        "Moon_Represents_My_Heart.pho"::"https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Moon%20Represents%20My%20Heart.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/Poem.pho")
sha256sums=('f1b726d0739e9e3ab95831e5750fae5be5cfb143f2867faabe79dc873118fa33'
            'c92b5a67af00190ce5e6b911e9234c892045538316190758966cd5c42d70822c'
            '8c81b4d1a3dae34a736a18035703122629f87f5f47caf65fffbddcaab35cdd34'
            'e43b83e7c909ae3885af1ce271ed5985b4308ef4524a9ca88138a6b2ad28c054'
            'dde3a3a1ada0c9cb71b25d58793c47e605d6b0745abf3c7f1536511f96c2dabd'
            '003ab7a574ddfd01a36282dc2383995f0fb952d136682870b5cabe4e3472c842'
            '4702713d9d35b88f18d35cedb18ccbef7c2dd83f862de835d84d09de931bc873')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    Jasmine.pho Message.pho Moon_Represents_My_Heart.pho Poem.pho
}
