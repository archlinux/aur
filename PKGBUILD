# Maintainer: Paul Stemmet <aur@luxolus.com>

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

pkgname=vault-agent
pkgver=20221120
pkgrel=1
pkgdesc='Systemd service and configuration for Vault agents'
arch=('any')
url='https://developer.hashicorp.com/vault/docs/agent'
license=('MPL2')
options=('emptydirs' '!strip')
depends=('vault')
source=('vault-agent@.service')
sha256sums=('c87a9312392507c0121e567bb067f6a0f1ce57fc865635383de3d525698f99ac')

pkgver() {
  date --utc +'%Y%m%d'
}

package() {
  cd "${pkgdir}"

  install -D -d -m755 "${pkgdir}/etc/vault-agent.d"
  install -D    -m644 "${srcdir}/vault-agent@.service" \
                      "${pkgdir}/usr/lib/systemd/system/vault-agent@.service"
}

# vim:set ts=2 sw=2 et:
