# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=zero-breach-toolkit
pkgver=0.1.11
pkgrel=1
pkgdesc="Offline spyware-triage scanner: checks local device traces against published mercenary-spyware IOC feeds"
arch=('any')
url="https://github.com/interplains/Zero-Breach-Toolkit"
license=('Apache-2.0')
depends=('python')
optdepends=('android-tools: adb access for Android acquisition (AndroidQF workflow)'
            'python-cryptography: decrypt encrypted iPhone backups')
source=("${pkgname}.py::${url}/releases/download/v${pkgver}/${pkgname}.py")
sha256sums=('91254ab664f343f66a5116074f766ed48db732e7ebbcbeab082e41a60a46912d')

# Security notes (audit 2026-10-29):
# - The pinned sha256sum above locks the exact release artifact that was
#   security-audited byte-for-byte. Upstream also GPG-signs releases with key
#   C24EC92B12D6670A2516065F9B4D575499AFA53C (self-published; see upstream
#   docs/VERIFYING.md) - verify out-of-band if you rely on attribution.
# - The tool is offline by design: scans perform no network I/O, it writes
#   only under ~/.cache/zero-breach-triage and user directories.
# - Upstream releases frequently; bump pkgver ONLY after re-reviewing the
#   new release diff, and update sha256sums from the signed SHA256SUMS.txt.

package() {
  install -Dm755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
