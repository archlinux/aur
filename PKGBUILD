# Maintainer: drzee <info@drzee.net>
pkgname=aws-mountpoint-s3-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Offical AWS S3 mount tools. This allows mounting S3 buckets into the file system. Not full POSIX support, see: https://docs.aws.amazon.com/AmazonS3/latest/userguide/mountpoint.html for details"
arch=('x86_64')
url="https://github.com/awslabs/mountpoint-s3"
license=('APACHE')
groups=()
depends=('fuse3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(https://s3.amazonaws.com/mountpoint-s3-release/${pkgver}/x86_64/mount-s3-${pkgver}-x86_64.tar.gz)
md5sums=('3b4a7cfb8dd5f821dea33bf66efcf505')
noextract=()

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/opt/aws/mountpoint-s3/
  cp -R "${srcdir}"/bin/ "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/LICENSE "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/NOTICE "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/THIRD_PARTY_LICENSES "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/VERSION "${pkgdir}/opt/aws/mountpoint-s3"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/aws/mountpoint-s3/bin/mount-s3 "${pkgdir}/usr/bin/mount-s3"
  
}

