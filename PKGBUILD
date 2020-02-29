# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=mbrola-voices-ar2
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="An Arabic male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/Ahlan.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/Sadiqi.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/Sadiqi.wav"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/Welcome.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/Yaqum.pho")
sha256sums=('8791680f98b78392b1dd282bf59a240144dd0262e77453461ee284f344a382c0'
            '4f46b9a558310bbe2afe9fb789912f6332c056739f874c3ab987eb7ccf8191ef'
            'e311a499255d130a7f78d8c581fea9c4cf4d0eede2972ca5793e8d3b18dd9748'
            'c89300b8d4f1ff1f4f92a4dc55b3333ae7e27e0b1bc5f0aeb79487bf0ca26583'
            'e7c8a4e40d4518484430a6baa2ca578086ddf3baeb7e09c09174928957741daf'
            '494b6040a181ea2776b1d4b0d5dd3b0caba0b3144257324cfe9e1c3b25db0e6c'
            '3150f4220538e55b5e5bc055af79594cfa1f03ef2143342210835e894f033072'
            '8aa3d9856221239d6587ca32b773388a8a16c2ef9920f268ee8ad4594c7ba29d')

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
    Ahlan.pho Sadiqi.pho Sadiqi.wav Welcome.pho Yaqum.pho
}
