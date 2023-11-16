# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>

_pkgbase=kubernetes
pkgbase=$_pkgbase"1.26"
pkgname=(
  kube-apiserver1.26
  kube-controller-manager1.26
  kube-proxy1.26
  kube-scheduler1.26
  kubeadm1.26
  kubectl1.26
  kubelet1.26
  kubernetes-control-plane-common1.26
)
conflicts=('kubeadm' 'kubectl' 'kube-proxy' 'kube-scheduler' 'kube-controller-manager' 'kube-apiserver')
pkgver=1.26.10
pkgrel=1
pkgdesc="Production-Grade Container Scheduling and Management"
arch=(x86_64)
url="https://kubernetes.io/"
license=(Apache-2.0)
makedepends=(
  cni-plugins
  conntrack-tools
  ethtool
  git
  go
  go-md2man
  iptables-nft
  socat
  rsync
)
source=(
  https://github.com/$_pkgbase/$_pkgbase/archive/v$pkgver/$_pkgbase-$pkgver.tar.gz
  $_pkgbase-1.24.0-static_cgo_enabled.patch
  10-kubeadm-kubelet.conf
  50-kubelet-sysctl.conf
  kubelet-modules.conf
  kubelet.env
  kubelet.service
  $_pkgbase-sysusers.conf
  $_pkgbase-tmpfiles.conf
  kube-apiserver.env
  kube-apiserver.service
  kube-controller-manager.env
  kube-controller-manager.service
  kube-proxy.env
  kube-proxy.service
  kube-scheduler.env
  kube-scheduler.service
)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
# sha512sums=('57ed8619ebbf1c2c5a6da299b8eba840f6bb185981eb18f840c7f68b8da91684bbbd0136d993a74caf5711177330f60ea5749c64c75d8d219d62751e09c298bc'
#             'e98921d111fabf2c353df589dea0fab57b0b174079483b4092741cc50553a3b765cea4c784e42ad9ab90827581cac028af4fc7a2db5acde1877446882393ae78'
#             '5f7132636b6afe9f00dc450c58073c0829942fa44070e7ec5a2c227c485c83f076bdea081d207f926b44d02700be65bf19a61f5d8d1472edd480f980e6ffbc3a'
#             'ed5ba22b37eaa9f4950ff3b57d60dd7866fcd5b8bd5197eab3170470528e8d91379483d3eb724589e695184f9b0ed506ebaee73ecca0dc40afdb5f35e79d178a'
#             'c318b64a03da07dfe435b2d8c368e55b0ab567da78c57ed814a7864fa75aeac52b28cf562b4afd8daa52168af93b318c1fead557ee676e950af25d422c276a17'
#             '3e1da5921322a2adf2a03fa8cdc900011031d73776d481da1a7bc81562e1eef84f8f1b4cf808d63382159f3042dcfba9b0ee5426265cea97030b764e75d8cb1a'
#             '5af6c3ffd02421586e81fac170f89ea30ac966719589ab4b4931498ab0071669faa44c7009516fd1d69bef2546dbba03bdf4604392de8ad5e1ada5170373c48e'
#             'b3cc10f025ce59f19c21deed3476f309db2059ee48dd1467f64fdd5b198537c94a1b3eba822d6f8c79bfb394dccbd2ea5c8840f32900c8ba153900c2df77abd1'
#             'fbcde2b98c16a0841dd04e709834755f50bd52137685ec724dc5b2699b008b77bf03ecddf0781b9f837c0f392a84e70536bc579ca3f8329a8f5fceaa39dd018c'
#             'dcb0e59117f76d3230cc3666dedc8a171636816141af43802dc047a9d1855f66298d690259bc9b6b63d66c7488dcc4cb65f99c202d7b46705b70d0ad87644520'
#             'aa9ea75606faf5a70307b4afabba0a0b310429d26047f21902a29a7b05261a78a36aac0b4e04ce1cba898fbe8d93ab971068fa8d624e9fd4913b88a632b360e7'
#             'f1b8ea6a4a18fe6258fd45105b100db63a8a9151c0c6ee532569ba25cc5749f239afe8a5ee469d7a91f9d39c30cac8591936c65e3252b4278b1f422f98855d45'
#             'd0ffbbae151a64590709b8cb24547becfe809daf2fc2b1af22fcb1e1de87c419fa986dfe81cfab5bac8413554db1df59e6498c04eddba0ad8efec8889756511f'
#             'c5c16d97afc0fa455981a56794547a4e6e8a710b1b686ccf84645c8001a601fa41b624ad0009bf21e56ec2da35874ac7808731b4a5b9b0fd80fc188714708f23'
#             'dd4efa137462905f9e29a99d69b747ae35e58ba8152794bfa417325953dd5059bad96fabfabf73ce1ee2310dc4ab4d1b95c8d931d33b81c67addcb614a51be54'
#             'ba277f765959ddb8aa0dee5a86cd9df1f40fb3f6ea1001f24825dbf21bd9342981d13894301170431729f76e710f70c23481e4061c64be29517ff497490f1ef3'
#             '2c25c0e11a7b2d6d61e03f9afe7ba21f9497495ab02e85f2623ce8c71019fb8a1af16197ab3968d5da050c2188c3e67372aa43322ac91af84f7da61bf73596bc')
# b2sums=('0de1e016c6e5d374afe08552cccd213a55f5c142cce1dc58970bb6c88a857cf8c96f2a0cafe7c542df547eceaa4b9d96a679866d3c364e05e788a74ecf6e475a'
#         '94a21e3923396b5a97a1e713419bab1f897ce8a4eedbbc2c0ed82fd1fd909bb69183c349322d2a774afd26c4beeb9972a57c6d4f67ef527c7e0ca7ea20651d43'
#         'dbab30d7e1b566027fec9d6a95dd41ed8f64399c39aac07fb4513ce21050eeeb4a226adfd513f76921c305945dfa4a140602ede574dd5eb4cd287e0f2df21714'
#         '27a8dcbbe06fa7aea122fc87ca663710ae2179c995270d94e22c905422e2639f3c9c81eef6723467c76366062381d8bd65e84ef79f47fed7c240973a55f5cb0e'
#         'a03b8a2ce6a606068cad278c6b8039181968c132a935448bf45e1b3668357487da1528569ed582b107db0654a1614b784a73c726729aad42abed18a4c15ce5b6'
#         'fc6adb72caea4062ee47507f72aa89a2d1d946597e3cf9563230f4a005f7a179c9543b95e648946d23b66ffa6feb3a6bdfe254aa85047d287771845e346cfffa'
#         '482d5249e79b14f3f3e4f51d66513f8e6802fef7574ee461c2440febbda8baf1a3e700b1f28774c17db9c0619898477a196110e6c50324a9ff04b002e88b4b96'
#         '588c2c61496fa93392122e6927877df42826ab94b922e962b8541968d3baca343c699e9f244001782c9fc42ff84b684659aa1f29dde79dac66cd38b4b0499257'
#         'b2dda66fb2ddb5ab63059c63773c56c035c51c9cb9856860340eb52d89796d7c109d4cff7d76a482aef8674c83b5fb389095b7d78c3b3217d7624366697f5d83'
#         '4a3454dc3ad105fe17fd2620b2627e8949776176a7601216d77017fd276315852a3a584bea4f45c127ff250640e02ad319db006ef681b784f87039f7ee098bec'
#         'a8bf21df4fae1854bd394529323bb4252095d98551d6133bf239b58abf6d58f0cd048236b4f9d2481e06204a4e072c284c36aa202c889dec2c684c92facbae28'
#         'e57662608a39a59cc9079c5e6276fb6936dcf6f4a9b95c38606dd325f51e6a03e866f272ef231b46697aa5a342869443b2884f44b3152edc3e9a4199ae3f961f'
#         'b3ca3299b9bbc450c50fb59f60b68029b1abbdd9f0e01e823710dd203a00f5457f4a8cccfeef9ef083e2875b36fb3712af9fcda6ce911c68ca22831e8e1b4298'
#         '082474a56525f7ea52315fbf9d765081d9f6bbd20ab4213bc2d2a6ddb8a3764987e365f08f157be6deec53f9c1bf2fb6c99595f5649c631e8610fcf81ed61eab'
#         '5ce796468c442d76f311d1c620576dcd2c784fcd40ecaa68ca3a6d7c089e8703506f712ee918f89ddb4debfe061cea3939fa4f2d2a77553dd1cd7aa4fae17729'
#         '4f35d3b5296839dd68885b924a41725a3479c2725c77887038c7d402a6aa754e37fe0d3697e746a1b65a5236f9e927df01e99a66d37d227cb801965575403788'
#         '95a5345e044b8fe9be01fc6230f20b3b12118c6f1fcc3e7ebbfd4d3a3d205dfb492ff0c11397d3dae9abc0cbba83c659ea23803b71c8e240dddc30bf4791dbc5')

prepare() {
  # set static builds CGO_ENABLED=1 for full RELRO
  patch -Np1 -d $_pkgbase-$pkgver -i ../$_pkgbase-1.24.0-static_cgo_enabled.patch
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  # NOTE: -mod=readonly in GOFLAGS breaks the build
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -ldflags=-compressdwarf=false -modcacherw"
  # NOTE: this also ensures the binaries have full RELRO
  export GOLDFLAGS="-linkmode=external -compressdwarf=false"

  export GOPATH="$srcdir"

  make all DBG=1 KUBE_VERBOSE=5 -C $_pkgbase-$pkgver

  # shell completion
  local _binary
  mkdir -vp completions
  for _binary in {kubeadm,kubectl}; do
    $_pkgbase-$pkgver/_output/bin/$_binary completion bash > completions/$_binary
    $_pkgbase-$pkgver/_output/bin/$_binary completion zsh > completions/_$_binary
  done
  $_pkgbase-$pkgver/_output/bin/kubectl completion fish > completions/kubectl.fish

  # docs
  (
    cd $_pkgbase-$pkgver
    hack/update-generated-docs.sh
  )
}

package_kubeadm1.26() {
  pkgdesc='A tool for quickly installing Kubernetes and setting up a secure cluster'
  groups=(kubernetes-tools)
  depends=(
    glibc
    crictl
  )
  install=$pkgname.install

  install -vDm 755 $_pkgbase-$pkgver/_output/local/bin/linux/*/$pkgname -t "$pkgdir/usr/bin"
  # man pages
  install -vDm 644 $_pkgbase-$pkgver/docs/man/man1/$pkgname* -t "$pkgdir/usr/share/man/man1/"
  # service override for kubelet.service
  install -vDm 644 10-$pkgname-kubelet.conf "$pkgdir/usr/lib/systemd/system/kubelet.service.d/10-$pkgname.conf"
  # shell completion
  install -vDm 644 completions/$pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
  install -vDm 644 completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
}

package_kubectl1.26() {
  pkgdesc='A command line tool for communicating with a Kubernetes API server'
  groups=(kubernetes-tools)
  depends=(glibc)

  install -vDm 755 $_pkgbase-$pkgver/_output/local/bin/linux/*/$pkgname -t "$pkgdir/usr/bin"
  # man pages
  install -vDm 644 $_pkgbase-$pkgver/docs/man/man1/$pkgname* -t "$pkgdir/usr/share/man/man1"
  # shell completion
  install -vDm 644 completions/$pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
  install -vDm 644 completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 completions/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}

package_kubelet1.26() {
  pkgdesc='An agent that runs on each node in a Kubernetes cluster making sure that containers are running in a Pod'
  groups=(
    kubernetes-control-plane
    kubernetes-node
  )
  depends=(
    cni-plugins
    conntrack-tools
    ethtool
    glibc
    iptables-nft
    socat
  )
  optdepends=(
    'containerd: for using the containerd container runtime'
    'cri-o: for using the cri-o container runtime'
  )
  backup=(etc/$_pkgbase/$pkgname.env)
  install=$pkgname.install

  install -vDm 755 $_pkgbase-$pkgver/_output/local/bin/linux/*/$pkgname -t "$pkgdir/usr/bin"
  # man pages
  install -vDm 644 $_pkgbase-$pkgver/docs/man/man1/$pkgname* -t "$pkgdir/usr/share/man/man1/"
  # config
  install -vDm 644 $pkgname.env -t "$pkgdir/etc/kubernetes/"
  # service
  install -vDm 644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system"
  # modules
  install -vDm 644 $pkgname-modules.conf "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
  # sysctl
  install -vDm 644 50-$pkgname-sysctl.conf "$pkgdir/etc/sysctl.d/50-$pkgname.conf"
  # NOTE: without this directory a node worker will emit error messages upon joining a cluster
  install -vdm 700 "$pkgdir/etc/kubernetes/manifests"
}

package_kube-apiserver1.26() {
  pkgdesc='Kubernetes control plane component exposing the Kubernetes API'
  groups=(kubernetes-control-plane)
  depends=(
    glibc
    kubernetes-control-plane-common
  )
  backup=(etc/$_pkgbase/$pkgname.env)

  install -vDm 755 $_pkgbase-$pkgver/_output/local/bin/linux/*/$pkgname -t "$pkgdir/usr/bin"
  # man pages
  install -vDm 644 $_pkgbase-$pkgver/docs/man/man1/$pkgname* -t "$pkgdir/usr/share/man/man1/"
  # config
  install -vDm 644 $pkgname.env -t "$pkgdir/etc/kubernetes/"
  # service
  install -vDm 644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
}

package_kube-controller-manager1.26() {
  pkgdesc='Kubernetes control plane component that runs controller processes'
  groups=(kubernetes-control-plane)
  depends=(
    glibc
    kubernetes-control-plane-common
  )
  backup=(etc/$_pkgbase/$pkgname.env)

  install -vDm 755 $_pkgbase-$pkgver/_output/local/bin/linux/*/$pkgname -t "$pkgdir/usr/bin"
  # man pages
  install -vDm 644 $_pkgbase-$pkgver/docs/man/man1/$pkgname* -t "$pkgdir/usr/share/man/man1/"
  # config
  install -vDm 644 $pkgname.env -t "$pkgdir/etc/kubernetes/"
  # service
  install -vDm 644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
}

package_kube-proxy1.26() {
  pkgdesc='Kubernetes network proxy that runs on each node'
  groups=(
    kubernetes-control-plane
    kubernetes-node
  )
  depends=(
    glibc
    kubernetes-control-plane-common
  )
  backup=(etc/$_pkgbase/$pkgname.env)

  install -vDm 755 $_pkgbase-$pkgver/_output/local/bin/linux/*/$pkgname -t "$pkgdir/usr/bin/"
  # man pages
  install -vDm 644 $_pkgbase-$pkgver/docs/man/man1/$pkgname* -t "$pkgdir/usr/share/man/man1/"
  # config
  install -vDm 644 $pkgname.env -t "$pkgdir/etc/kubernetes/"
  # service
  install -vDm 644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vdm 755 "$pkgdir/etc/$_pkgbase/"
  install -vdm 755 "$pkgdir/var/lib/$pkgname/"
}

package_kube-scheduler1.26() {
  pkgdesc='Kubernetes control plane component watching over pods on nodes'
  groups=(kubernetes-control-plane)
  depends=(
    glibc
    kubernetes-control-plane-common
  )
  backup=(etc/$_pkgbase/$pkgname.env)

  install -vDm 755 $_pkgbase-$pkgver/_output/local/bin/linux/*/$pkgname -t "$pkgdir/usr/bin"
  # man pages
  install -vDm 644 $_pkgbase-$pkgver/docs/man/man1/$pkgname* -t "$pkgdir/usr/share/man/man1/"
  # config
  install -vDm 644 $pkgname.env -t "$pkgdir/etc/kubernetes/"
  # service
  install -vDm 644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
}

package_kubernetes-control-plane-common1.26() {
  pkgdesc='Common files for Kubernetes control plane packages'

  # sysusers.d
  install -vDm 644 $_pkgbase-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  # tmpfiles.d
  install -vDm 644 $_pkgbase-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
