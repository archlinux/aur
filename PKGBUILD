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
pkgver=2.16.20
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
    "0008-fix-legacy-pytest.mark.parametrize-usage.patch"
)
sha512sums=('e2dbd673c5dd28209b51588eb3455a19b8b5c979f5e3d883edac33e1b1095d06604eb6971d28fc9f000cee57cfe2f86c074ce1b49666b5d4b50060924490e4b9'
            'fb2af4f771e564e092725ffd93e2515a8af8b69dbcdc607b4c3327bff9b0891f87b97074a8d5222d7228b3d20c87c176a595b3a95669ba1b41bca56e6c73b8ac'
            '00c78f462458266d501842888e84f09c458927194ddfc433886497aed94c5d21a192a95500c9e2ba2a7bb3f79923f93cab99884002ed037fe620613d0c048596'
            '9d17e95d849cf4fe3ef0b9b31da93818f7247dd1160baa8e39c47d89c632e2ea654553e9cd6ef7d8f983f0e1836d6272eef2cbc1f5aa913044fa12ba52ec2edb'
            '49e73c77ced11af2e7cb284308d11d5d23180f39f3a8c326e736af1df34ebd7aee3ce5b84237da1c225af216ecc17becb29a2ba4690c8aa0d2aacfbefb8b4102'
            '6f749e63532b2a00b60940bf45f9dc8ab2a45e1bb4a01a32116d9151d0a873cfe259748b906d323ce9002106d9216396baf77758783445c50fb951482b7f4332'
            '635fc60ae79ac10998dc2659241977b876b426b17d0f6086de6fbb19e90bf7e4d86120b70dc0624be64bc9ddcc86305416b1b3d2ea67307beb733a6abfc063da'
            'ef092b5e69ef2a30eddd98109949f291464329e4f111f8d9d9a6f5a66c70eb15ae147676207c753cde85c3f108fe4b0c89826b43400f1bda80fee0569b4702a8'
            '72649a83554d0ddda5ff18e9d35bb4e5ff2eca36cc805c806c07dd8035ac1922b68e633ccbe623b6631195ebc13cea34b03fc1099f67d9c665cc8badf5244f86')
b2sums=('6e73808c8c83148b0c19dff466754291d43a4fb6185d6ccc9b76de6d12e6cc7e8beab65cdf26680979e2808394f4c373ad47fcce2c7c63b6403d0af846b7a898'
        'dd055a2bd17dd03fa44bf985e0690d8b1eb5d391d333e745d4f062c571ca7eea578133609e13ef6ff951069a0dc283e4b1dc5e2315d5c497ebe67122c63a3777'
        '59f15afec87b8a36461d919b7502474e24fd0fbc9615a8049676ccdc4e25043974f2b0c80fa6abd062653d18fbf1e023535844787b0c59490cef7d7d8e4c2d9c'
        'c2b05aead9af984b2bbe47073a8c2d13b8742733ac2738075832b99c785c33d87ee8ff6a02fc11e6265c57262a7444c5ef6e2f3bc1ecec2b14a88576bb13d4a0'
        '64ac246c07a861dd43cdb2dc80cd21dacacbf9ea8c99dd8dff1dca57ca2dc09795a5c736237e20f7630159dc1cefc7dc27777a850ce43fa0b96de49e8efc232c'
        '22e6688cc38051c08eb5102cc0d4ee4c3b152bf685e706e1c36c73f414bf446f41d8f31f99fbd1bfe13250e64d6484e4796791ac78514b5d199c6ed7c2819315'
        'ed237a5b96cc789b0a46fc66d025a63129e3751caa6c11c7c962fd590dc8a190f814f316b2a2d107ae6f8d5c7595728db64334230c4d74aa002b02f2d88c9ab9'
        '32031cd120762f155bed847264f65eb4dd0a72f7dedef1c63c33e9cc6d3bf6758ad8a685ce53b313e86828741f106e0b6df74bab00ec929d0b794e2227dc5654'
        'c73e734bd1c7040435723cbeaa40b8817e43f906e48f4d3b31d6a30ab389a4a30acff4fdfae35d00d0401156374eb43fe90034a260088ab8fc6d9dc11d2308c1')

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
