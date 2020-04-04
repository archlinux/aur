# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-tr1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Turkish male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/ikinci.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/ilki.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/phrase1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/phrase2.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/phrase3.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/phrase4.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/phrase5.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/radyosentence1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/radyosentence3.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST1/uc.pho")
sha256sums=('f3860aadf656a663e0fadea836632e57309a47e17a9297f530a7a7ef48647372'
            'a5f29348bc9e27ef3b0e657b56c39492028e8c73734dab7bcb3394c6e2b3cc47'
            '28be39fc3d347ec4cc23877de7d3077fe503bddeb1a9d8e71bb9a7b90358cd68'
            'fa87de6484b692ca4184a638badca8aa7eb3a7abcad0d237dbfe2216c46a4fd3'
            'fcae898ca024104e9b7dfda79dec00bbcc65e1ba5f93017ccc7fe45b334dd32a'
            '7b250cf2edf6410a4a78832acd5bbb62831486deaf2547ef3fd403130f64a669'
            '279a31de91bdd95421ca0edbba42ac3c37a46b1606f70e5cab3cb2e767baf8fd'
            'd633305362e33de8052a31dc31e41e69d5864e91a3d7ea37a81c6a0b4d3ee564'
            'e30f4cea650b7523b41d6e6af4f5ee8fe9b0ab971ba988e77e4c78bb960af446'
            '5e507f35c87fc766fe9e2cd3e779b999991b8866064c0f01da5d2d2959228505'
            '7627c2b943119e7afb0b85c2641246ce920cd1d865f66d68f20903ee63bec575'
            'bd1830290c5229920267806e22551ff8eb8afd2b48599f9d40d09e4633031c20'
            'd294640b8ef5922b2986b153e5e69416e7242ee697367e71d4c12523433f19ec'
            'b5e0bf874b82bb8dba9a66e98bca5c090a4276a5f79945bb7394727b57522824')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST1"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST1" \
    mbroli.ini ikinci.pho ilki.pho phrase1.pho phrase2.pho phrase3.pho \
    phrase4.pho phrase5.pho radyosentence1.pho radyosentence3.pho uc.pho
}
