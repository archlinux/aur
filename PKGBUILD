# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
pkgname=okta-aws-cli-assume-role
pkgver=3.0.0
pkgrel=2
pkgdesc="Okta AWS CLI Assume Role Tool"
arch=('any')
url=https://github.com/oktadeveloper/okta-aws-cli-assume-role
license=('Apache')
depends=(jre11-openjdk-headless bash)
source=(
  "$url/releases/download/v$pkgver/okta-aws-cli-$pkgver.jar"
  logging.properties
  awscli
  okta-aws
  okta-credential_process
  okta-listroles
  okta-sls
  withokta
)
noextract=("okta-aws-cli-$pkgver.jar")
sha256sums=('d57b8fd6de20e2bf595782690c273eb806aa555ceab20d5fa7608774f49aee78'
            '8329338feaf876b9f69a6dd3017daa6b3b3ae1964f6d1affb1025bb3e60a1cd2'
            'f97662794c03af235a6180bff312744aef2cdc42982b8f832559abd29e7a1a20'
            '1a61e685ecf8f8eb0f2648ebed25e4a46361ba65f5570aec0824c0d55c4687c5'
            '7db30ef7b859bd038c1aa1330b195ee55c4892aea115eb66901f76fe0358d669'
            'eb54ba8ccc0c15de6fa8949bba3d627a8e98286ff6ac8e2a95ce30b03e76961b'
            'fdd1686a380673dd4c2773fdf42213cbea800edd2dc9febe0438701d5e9fbb8f'
            '5bc43db550eea2cb41f8f640a17af46a1f6cc8bcc61f6dea69b6a2e49f68db75'
            )

package() {
  cd "$srcdir" || exit 1

  install -Dm 644 okta-aws-cli-$pkgver.jar "$pkgdir/usr/share/java/okta-aws-cli/okta-aws-cli.jar"
  install -Dm 644 logging.properties "$pkgdir/usr/share/java/okta-aws-cli/logging.properties"
  
  install -Dm 755 awscli "$pkgdir/usr/local/bin/awscli"
  install -Dm 755 okta-aws "$pkgdir/usr/local/bin/okta-aws"
  install -Dm 755 okta-credential_process "$pkgdir/usr/local/bin/okta-credential_process"
  install -Dm 755 okta-listroles "$pkgdir/usr/local/bin/okta-listroles"
  install -Dm 755 withokta "$pkgdir/usr/local/bin/withokta"
}
