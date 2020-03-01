# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-cr1
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Croation male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/BRAZILAC.PHO"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/EXAMPLE.PHO"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/KANTICA.PHO"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/NASLOV.PHO"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/ZALOSTAN.PHO")
sha256sums=('b5f85d7c4a8da013a4916945cb567d67d2731ca74a64c30513baa40f119cec44'
            '347b9ce510f02863b692d946b95f89370550b2f37c79ab79991f820371b5ebcd'
            '1c627ddbc5ece41fffd669640ecb7856a13ab1e06666bb93146beeff69716867'
            '626734c3b5cebe6a95d7aec4ac1f911e1ad247dd77b5717e146294d91636bad8'
            '13cfea0ec6a240a020c103398bb3ee3f38785f34c94b4da2e97a7f199352bdb7'
            'a797d34e00075f32b0673291ba34f286bdd054f4919850871d0080c5e23992c9'
            '66f5d1f9fdd20c428860ceafd928c27ba3d8efede66c2489a3c59576e593b205'
            'a4ba6591455d00ccfcbb5ebd5970c920964f9cd8df654d0e5bbccd66cbaf28ff'
            'a5cf1daec68a8a4a040c77244d0e270ea87cda654a2df930cd6712e504c92e71')

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
    mbroli.ini BRAZILAC.PHO EXAMPLE.PHO KANTICA.PHO NASLOV.PHO ZALOSTAN.PHO
}
