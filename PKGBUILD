# Maintainer: Gergely Imreh <gergely@imreh.net>
# Contributor: Gergely Imreh <gergely@imreh.net>

pkgname=abctl
pkgver=0.30.4
pkgrel=1
pkgdesc="Airbyte's CLI for managing local Airbyte installations"
arch=(x86_64 aarch64)
url="https://github.com/airbytehq/abctl"
license=(MIT)
source_x86_64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('bcd46d55d5e515fc2ccc92cd67d493825640c2977fb2d3dd81a5c965ef545534')
sha256sums_aarch64=('b471cfd849e6ca6749fba76b0e7354a78e6c7b37f5de887efaff1fbec9bdd9d6')
b2sums_x86_64=('ae6ff5c264197f25ab2f1509bb5e85bca0e959d1623f5152b13c138e2270bf3ffdff219012f4c978f58c7971c6247697729f4d129b1a9bdb13ac4010c3008639')
b2sums_aarch64=('b443e0361225d446071f1f6e481df622e702bafdf15d9fc22bf683e96ccf71a6680329ca2c536f91ab5562a14402a20455b1e7da62d9f815746558df7a8d65f1')


package() {
  sourcename="source_${CARCH}"
  thissource=${!sourcename[0]}
  sourcefile=$(basename "${thissource}")
  sourcedir=${sourcefile%.tar.gz}
  cd "${srcdir}/${sourcedir}" || exit 1
  install -Dm755 abctl "${pkgdir}/usr/bin/abctl"
  # ship license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
