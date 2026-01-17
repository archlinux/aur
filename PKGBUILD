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
pkgver=2.16.15
pkgrel=2
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
    "0002-add-3.13-as-supported-controller-version.patch"
    "0003-remove-crypt-related-tests.patch"
    "0004-remove-ther-upper-bound-of-setuptools-and-wheel-vers.patch"
    "0005-remove-bcrypt-related-unit-test.patch"
    "0006-add-3.14-as-supported-controller-version-in-ansible_.patch"
    "0007-adapt-TestImmutableDict-to-python-3.14.patch"
    "0008-adapt-test_check_required_arguments_no_params-to-pyt.patch"
)
sha512sums=('cd79668288cba9843a41d2bcbad66cec4de1aba45150ebae47bfaac13f9e5574f33b52822e29f55ed994f48d8006ce3671665189e163de32d27c74125bae047c'
            'fd5c08e58d4a3fbccde119b491497b84ab42c84810974fc97f652fe1fcaa101e76ccf0519aed777691006579136217f9faa72b8b0c6605c6138d82b455f12a4a'
            '150ca0a49f8208ef0d2f1fe2dfe0074bec22a2b03799ad814aec18d3c6cdd373151dd0173267b9a15dccbad65dc42d47203cd2494bdb0fa131df227e08cc0e2f'
            '0986b03812043e3b95b1426b98aa13c090555e92b1cd97d59d6438ff4fa20fe3367811ea5d5ed96816f9198bc15c16bd6b6183029be9dc4956cb778187fe4dda'
            '662f4fd831d87c66ab8b17002c094484af3e87efc64c0af3738d20e5702534931d1170aeb6d0a267d5a6754f6cc67f5bac336e00983774c9c1f8ed7f716809b1'
            'be618be7f1ba74c7aea5b004a88c6e7f90532023788a36685788285a99b1f27fb72f7af5f045dba884373fcd4f8af775ed933a0fead80dd08970ea4aac9b4e7f'
            '99d71ec9bf2ec65612424155c69a46347c827879319d919f1e956c618ee54af484db0e46fe34aba12e683d59e679099ee752265ac04cb1513bf73704989504e0'
            'a7f1944db981dc6790b405968ba03f86c4023f55fd9741b88c792c07ad7b818f3224c28bc99ddd855c27dc24004ca7ecc86853fbcbb6a0a94d9b4545547ec514'
            'c554e0a29b1fac4a813edd8b6514b742a11ac5d5c842fb7b04cfc4e3a92b22bf6e1ff800cdb3e6f371b58699615010a4db01daf29b68b9a1bfc465d740e37631')
b2sums=('5d669ec8f6585f2a093e326b630f30ddc0afbd801484a7122fb490f0e10a67ddc26539a076d6721da39702c70a00e7e132aa98cdf7c4629493202c76c43a7c99'
        'b8a27f5ae341275843660a8839c8f779a4cd42e6329bb87d3c271d77adf6b752bad7a5236e4b19fa2e988425a412bc8da28e726445fcfcb00347697480db6ee4'
        '11de72a2de390c050fd8cbd40bb346721eea290c1514ecd92287cf0e51ec9bbc56448d6be9b50af9b57338bb527f4fb77508e858ca4b23e6e05e28327c124ba6'
        '470d4a6c5604c2753bd1a3af5b0673fb74bb8975f18fa07084faa48bb523ed9eee79b3f15ab8c9876253234b2b8793dd6a0bc4ef288bc761f33abd7a35a1d0ea'
        '70fe74713c9ff9611cc7447d21b9d3b2d822f298e9e53c546ff367fc58700950365eca564240baad20e14183709fcda64e359473fe49097a8d794a304ae39082'
        'a2f2b964532eaf830360b48add8b49c61bf4903be530a105f618ba7a53fc05fde52121f2d761e113fd0bacb8df7ce6bb3c330ab5c258a15c85ab1f28a34071a7'
        'e0d9fdd7332729d5b9f9b82b75a6d49b3ff998d2f2a3da86f05614f96a0d4497daf9e38067fa5d74843324f9d671721934e4e7b222fee4503eb1fd45342d8db1'
        'e5db97c6dd920aacde632910f5ab3b065d035b1b39b52ae073016ec5c079436f7e5effda9ffc1e7edc385b8e664836555b7b9a929aa4590a7026ab18fa8c3982'
        '1e0a1f300a6e5bc83c31a7e4bf1055f3f3a085257235e0e6d4012e93ddfdee611bc3611ac71486e9b0e8518c6494956243e19b05649790ac70695c518e2028ef')

prepare() {
  cd "${_pkgname}-${pkgver}"
  for patch in "${source[@]:1}"; do
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
