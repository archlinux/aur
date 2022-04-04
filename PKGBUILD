# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=nerdctl-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Docker-compatible CLI for containerd"
arch=(
  'x86_64'
  'aarch64'
  'armv7h' 'armv7l'
  'ppc64le'
  's390x'
)
url="https://github.com/containerd/nerdctl"
license=('Apache')
optdepends=('containerd' 'rootlesskit' 'slirp4netns')

case "${CARCH}" in
  x86_64)
    _CARCH="amd64"
    sha512sums=('875c588aa481cbcdf3184dc073f92a751982ab000f8df70eefcf0ab174fcaee2f566fcad047e39bf31a5d5fbd180d67a266dc121f2384ef638d618b3b2cd017a')
    b2sums=(    'd1ba81b0ed0b03fae67712b5568b171a6d3f01caad776551c6564afc61720fb00de19ddfc1938d63615c9c05c34bbeb0213c69d1c6eda772b9b76be4581a8f5d')
    b3sums=(    'f4e5188fcd6406e593297d767b35acbb8ef6b08fb5ef2317023845c7a711ba0d')
  ;;
  aarch64)
    _CARCH="arm64"
    sha512sums=('e8f57b3794b846198b7d329d578bb9963ff80875605271ac288578382a6875a07654657411a9269454eda4ab6eb2b0536ef3b2c8959dc7a7b2ec21c0673aa6ea')
    b2sums=(    'da8e22ff216029944aae97ac6a971a17866bba1ea131019d8ada124c3693714743b59dd4a615fd48882ca376f093452048432ec0eaa2b04956a4958d8a1e75d9')
    b3sums=(    'f3fe97cba7fdbcf81e1391da8ecfc48df0bdcd779fca9d75f849f448ad32b075')
  ;;
  arm*)
    _CARCH="arm-v7"
    sha512sums=('15f6ee191fcb81908c691c673e5cf13238388a0c1492b1fdf6df27fdc176379c46010c436f0d6e26c50c1be30407b52d3a4c73abc53746c91ec316e4dd708349')
    b2sums=(    'e0dd202c44a233c77af6ed8b203867084766b61f547f55b7e410a809e9b6e40d887605018b924ca3138a3573a3553b46e21b8c8ad485f2351716071a39ac6e30')
    b3sums=(    '7a313d17de333a0c5162a837cde149c83d9851bb2bc946caf6c35684b37ff947')
  ;;
  ppc64le)
    _CARCH="ppc64le"
    sha512sums=('3d3f3788b6d90fe62c4e260de34c80d59d10dfaadbeb5fc3d50bbb014e7b181a01873c0a501dd44a083698d47a617c24dc5c618e982e4dbbff2e023775d7b7c1')
    b2sums=(    '77a6a0c0392997093920e3addd2f71104491a3e4b0fde92a9516291562dbac324428bcca10c064384eb8b5fcd82f6d628cd706e65fe5ba4b3417c4a59407a4ca')
    b3sums=(    '3e504ce58d98dfdef1b5f47e3efe1b027f197dda62a14d43e8692c067c8718b8')
  ;;
  s390x)
    _CARCH="s390x"
    sha512sums=('26bdbe1b0bbc68ff2bb38fa45cbf578519627ea03b89fa5bf16d896f0a06c387cb1380487c437413589c813ceca3b34541eaf9ba0ff4c687aec685678cc1f793')
    b2sums=(    'ed2c15368369d51e9357cb769b2d057ede5261c355c2cd17bad9e6436e2efc1369f988c8fb221fa0200f781b6fc19919f04963d544640c8d72ceff0436dfaa0c')
    b3sums=(    'cc3e180b2fb9bc76441e3a7f0ae29905a604d773285a0501c7481cca8e0a680b')
  ;;
esac
source=("https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-${pkgver}-linux-${_CARCH}.tar.gz")

package() {
  install -Dm 755 "$srcdir/nerdctl" "$pkgdir/usr/bin/nerdctl"
  install -Dm 755 "$srcdir/containerd-rootless-setuptool.sh" "$pkgdir/usr/bin/containerd-rootless-setuptool.sh"
  install -Dm 755 "$srcdir/containerd-rootless.sh" "$pkgdir/usr/bin/containerd-rootless.sh"
}
