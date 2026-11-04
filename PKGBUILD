# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=zero-breach-toolkit
pkgver=2.0.4
pkgrel=1
pkgdesc="Offline spyware-triage scanner: checks local device traces against published mercenary-spyware IOC feeds"
arch=('any')
url="https://github.com/interplains/Zero-Breach-Toolkit"
license=('Apache-2.0')
depends=('python')
optdepends=('android-tools: adb access for Android acquisition (AndroidQF workflow)'
            'python-cryptography: decrypt encrypted iPhone backups')
source=("${pkgname}.py::${url}/releases/download/v${pkgver}/${pkgname}.py")
sha256sums=('98279a7212220260f78e72020e52420565cc6c0c00f25bb02d478902288b80fc')

# Security notes (audit 2026-10-29 for 0.1.11; re-checked 2026-11-04 for 2.0.4):
# - The pinned sha256sum above locks the exact release artifact. The 2.0.4
#   value matches upstream SHA256SUMS.txt, the GitHub asset digest, and the
#   release notes. Upstream also GPG-signs releases with key
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
