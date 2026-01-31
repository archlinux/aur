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
pkgver=2.16.16
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
sha512sums=('512122536dc7549ff36c1b3b4c54749e7027ce1de23facb79e446a57c7dfdc52432fb8913e3eed69afc7bab30f035447e37d9b717e5c9413418ea16719f9179c'
            '8f6228757fd10bb6d18953c9aa1f9f0daf053a5eaf0645d6dc725a2484bc83573e79bbd9f3d8d5c8ca1b5dd2141321756c3c304f910b03f1c1dfba25c5cf5329'
            'c6090ca3f7246b89359dacf04a213cc80c313a2305b55935d68908da7ae94701b9b9c44b0d87407d5f7efa7e27ba4b3aa63d5459957751ca53405f5412fcc4bc'
            '8530d82c9e5b5f57040b9a209db301f8da31be1a34bc0d24a40cc43525ae91834427f7801f372e1047c2096a4da42169167c4b9df18d8b5f26c517a74cbe07d0'
            '0ee8a117ff3cf10ab4c2480dfa4af47f68b9d63887c2a551fb171f10c148859d2e9421c3894bbbaa755deee1705a3c00e87264cf7988fd47fe26176af56dffab'
            'c65f6b50da01e4271bacb6d9fed6831c4c2e808cfc669ead0a9de0846b9e93550fc16a2cd8d6b0493c6c4797be05470bfeec320824ab483636963f040d66ad82'
            '464bcbdaaacd4cf0ef75f25d11b8411b162847ed26f77cb9b753547d0f6eb676d827a71bd5a29344070a2f6ec840cca095ac61380ed156b47b82c445fc346f29'
            '42d23612eeebcc6e426281823d5b89a2e18a3d9d7933b46cb12872a17a56dccfb6942c30239e504b468873ee8544384bc4a4736a40a83fe0e640d0b55c966911')
b2sums=('d5653a4b6c2a2931c79203983efc74f02c47057e75feb91e052928fcbabedee8c9c12d465944fcda2f05d2b47446aa848a3ba946a8648ca729ffbb47c5b17030'
        '961419638a1876ec4ce1a006d6d23946e57a9ff42f46591f58d719d98dcea860189c775a3e154d8902267a4b6f71875c1d31d58bd1c564b195364e74fea952ae'
        '118873c3aaef7cb1098bf164076187fc4f2a72b9d706bb7616c541f84db13413f5eb9abd5bc1a957781ae53c8b1c40cc649d1727387805b34bc287a9fb489251'
        '00abc51721a0a31a636ddd60f48d92f6d3ee7265ff8f6fdd56c85e332b665aa7947c4ab98e5d154ff31cf4f98a42af5d7b4424cb75df690517ee1a170b960745'
        '5add95b5995bc0955f872698af7bf5463e23b6a127e0d212bcae35f9c0d4af82ae663d967df22918550a3c3bbcdba061e6a240973d702d0cf9cb30b7ce20df3d'
        '5d06cc81fa26c85956a41f7827dbbad21ed92256e5c2100e5601a995c8b22a8c725db75977d89862ae1f14148a10e6570926e114422a1f5fb6604885e11a9c9b'
        'ad0f7ab582c861f038d571187b22127658d5a7deba8ed3303ca9884fc8fbdbedf244b23441945547a371024620c4f86c05075c44aebef2058857294b9746086a'
        '117f2c32f638034295bc0f9e775cc5719bb09bd25eb6db0c8bf351b78a9ff60cceb62c0983509ad00572d1f668a6fc051fd167b6131e7cd7cd7c89e783c63ea7')

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
