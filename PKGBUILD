# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-hn1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Korean male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/hn1roman"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/hn1roman.mbroli"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/s131.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/s131roman.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/s132.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/s132roman.pho")
sha256sums=('dbb2f84a77f0bd6e652e5cfcd8926da8051fd4393f6384fd554ae4d0d2f09504'
            '9f53c52f7da3b1beeef0f34c83559babc1fd90205e2f6afb191b7119a0e5bcf9'
            '8f470249fb0ad34105861cec8fd797c25c1a38696c42693a3da07d7ffbd05ab2'
            'b5ad8c771c25b3a2dffccae5d3bec287fa94de8be3058cf07d9677b9309b1961'
            '01efbce0a3efb46c50423f6cdb70a7ad3c8ba6673291dd6bab397913c94c92aa'
            'a5e1523421d03681612c27ce47f2b8f05149f2f44b0aae8e8247d07ad9b91899'
            'd436498c2a940715fcec8be9153c9c2c2afde052af732140c550259e763cc79a'
            '00169ffd6aa673f73a981038fd13fd1ac96cd86d18b988114752f781bb906f68'
            'ab4fc2395282cd8378f9e3db244f2a7785397e5952760f7d3d6ec4bf5cbdc57d'
            'd10fdafe84ac298f378fa08db737d6c6df9ae7a571c214b2bea88c6f7e92ca03')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    mbroli.ini hn1roman hn1roman.mbroli s131.pho s131roman.pho s132.pho s132roman.pho
}
