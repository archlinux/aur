# Maintainer: Nicholas Yang <nicolasyang243@proton.me>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Chris <seitz.christoph@gmail.com>
# Contributor: m0ikz <ndelatorre@moikz.com.ar>
# Contributor: atweiden <archbaum@gmail.com>

pkgname=ansible-core-2.16
_pkgname=ansible
pkgver=2.16.19
pkgrel=1
pkgdesc='Radically simple IT automation platform (legacy version with python 3.6 remote support)'
arch=('any')
url='https://www.ansible.com'
license=('GPL-3.0-or-later AND BSD-2-Clause AND PSF-2.0 AND MIT AND Apache-2.0')
depends=(
  'python'
  'python-cryptography'
  'python-jinja'
  'python-packaging'
  'python-pyyaml'
  'python-resolvelib'
  # not directly required, but either convenient or indirectly required
  'python-paramiko'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-docutils'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'git'
  'openssh'
  'python-bcrypt'
  'python-botocore'
  'python-passlib'
  'python-pexpect'
  'python-pytest'
  'python-pytest-mock'
  'python-pytest-xdist'
  'python-pytest-forked'
  'python-pywinrm'
  'python-voluptuous'
)
optdepends=(
  'python-argcomplete: shell completions'
  'python-dnspython: for dig lookup'
  'python-jmespath: json_query support'
  'python-netaddr: for the ipaddr filter'
  'python-passlib: crypt values for vars_prompt'
  'python-pip: for module to manage Python libarary dependencies'
  'python-pywinrm: connect to Windows machines'
  'python-setuptools: for module to manage Python libarary dependencies'
  'python-systemd: for journald support'
  'sshpass: for ssh connections with password'
)
provides=('python-ansible' 'ansible-base' 'ansible-core')
conflicts=('ansible-core')
replaces=('ansible-base')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ansible/ansible/archive/refs/tags/v${pkgver}.tar.gz"
    "0001-do-not-pin-resolvelib.patch"
    "0002-update-the-upper-boundary-of-controller-python-versi.patch"
    "0003-remove-crypt-related-tests.patch"
    "0004-remove-ther-upper-bound-of-setuptools-and-wheel-vers.patch"
    "0005-remove-bcrypt-related-unit-test.patch"
    "0006-adapt-TestImmutableDict-to-python-3.14.patch"
    "0007-adapt-test_check_required_arguments_no_params-to-pyt.patch"
)
sha512sums=('94eeec50ada911bdef8f2dbd3a10288322f7a4ba9ec76e60635e9875ed83c0c36ead0a152050e376bd91270b35eef2bfc534ad102685c0dc3b2c043b4ac0a114'
            '6703f688595c7b251286238abae72447c6a45c0a9818ae6bccd678412e72f4236f46d25c019fd7208bb634fcd7acc7f953ce9cc8b95f3c1bf38108589cbafac5'
            '154fc7598642ab7357bae4f2e1925c26f720a08b736e393f31747bbb51466acc5344cf09021fb9114c05b1c9b1cc7fb7f252252cf8b1d7b633a303b1a9d3eb34'
            '1f5b722c62acfa1aa09dffc6ecd18f9f9b5857ff2f3047225138e8c6acb963b596344c587408e4fef3c7ab936ad3bc532fd774c925e9ba4fff08f736f8b23c79'
            'c486d5157f87eb1d9beec80160219651228f0e65ea0277f86a16eee494d22b30e1010e85d8fc4731746e06dd2b2cc40d0394fa45d0397087675c66cb74b09ce4'
            '0e19ac6810cb4c1940429c0f611bf6922a547d5818d271456b32ded91d01378c837ffd70227e3e7fbc130494a6f14e7d836ceb0a723d66bb6840d5ab3383d719'
            '44f9bc6709ca20371a88125e19b394a8f1198f8ade59b24a25d052f8c409f334009977c93387adf7d11a1b3a4e1bffa7c05a47d74b1da9d348e9060c8dc1e780'
            '7ba85d0c8e882c8d941a41bddd82f9c893b038082c4c4da8f10c01c6b3b91c0ae8bd7f94ef04e4fec7c0e86dad5a5046c91a53a2b1f9e2bda6c8d7ea014f78e5')
b2sums=('17da08e8d41699637a8d991d7705793553adaeb79156c6eb3bd2c8ab5dcd0b947ac7fefb1425ea841ac75e97b10eb05963af18e4df6d39f1b6009586807d853f'
        '36260f87edd9b3c48f758d81aa9614dffe6d3117b7da48acc6844542371d5d125fc688ad351438684e5ec1861dd6ad218c68a74196e171134d33287eca892ba4'
        'c1073e482cd413caf42c2fbc20e618f6121a2d6a0579e5c48ce7633174370456cd5dd8d91bffc8ad6a630fde10657a3a367667e16fdcd4f5113c16cbfebea8f7'
        '512e6fe36d656ddf5f709310cc43daf43756bb5370feadf08ddec260575522751eb90e761afb2ebe4d4b0ba568494cc58dd00ac6304e68b717a96e8d0b04245e'
        'ea725aef7161c672d73a27ecb1664a91710a61e878a161f578781dc7b08d7f48f38c9a1e0edf2e1329a64a75467c301a19f0ab4e81946bb5e046ced3ebafbf11'
        'b916f784cfe42f451eecdfa77448d029276ef8d76b23235adfe90c982d6bdce2224efbfdac1cf0103509cf0c34937ecd51ed0c7eb15c5f7510cb73c915f3471a'
        '5624ecc2ae583cc66c48e393be48e00fa423df347fd73c6f0bbc44485a73b5b80573eddc54ee6377667dfea8b062a2885c61b8912a5325ac7d61b3f865be1b25'
        'e97e3e71d97298a8c88472be681e80dd4c13d238e4b5ad9a920a726c66aca7c045062082d6af7e2ff94437b09c32a57c118df0e89c21ee6c767af826aad38b5a')

prepare() {
  cd "${_pkgname}-${pkgver}"
  for patch in "${source[@]:1}"; do
      echo "Applying patch ${patch}..."
      patch -p1 < ../"${patch}"
  done
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
  python packaging/cli-doc/build.py man --output-dir man
}

check() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  # tests require upstream wrapper to find ansible-core internals: https://github.com/ansible/ansible/issues/80472
  cd "${_pkgname}-${pkgver}"
  # we do not have libselinux packaged
  rm -v test/units/module_utils/basic/test_selinux.py
  bin/ansible-test units --python "${python_version}" --truncate 0
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 man/ansible*1 -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 licenses/MIT-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT-license.txt"
  install -Dm 644 licenses/simplified_bsd.txt "${pkgdir}/usr/share/licenses/${pkgname}/simplified_bsd.txt"
}
