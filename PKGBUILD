pkgbase='python-facexlib'
pkgname=('python-facexlib' 'facexlib-model')
pkgver=0.2.5
pkgrel=1
pkgdesc="FaceXlib aims at providing ready-to-use face-related functions based on current STOA open-source methods. "
arch=('x86_64')
url="https://github.com/xinntao/facexlib"
license=('MIT')
depends=('python-filterpy' 'python-numba' 'python-numpy' 'python-opencv' 'python-pillow'
'python-scipy' 'python-pytorch' 'python-torchvision' 'python-tqdm')
makedepends=('python-setuptools')

source=("https://github.com/xinntao/facexlib/archive/refs/tags/v$pkgver.tar.gz"
'https://github.com/xinntao/facexlib/releases/download/v0.2.0/assessment_hyperIQA.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.2.0/headpose_hopenet.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.2.0/matting_modnet_portrait.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.2.0/parsing_bisenet.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.1.0/alignment_WFLW_4HG.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_mobilenet0.25_Final.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.1.0/recognition_arcface_ir_se50.pth'
'https://github.com/xinntao/facexlib/releases/download/v0.2.2/parsing_parsenet.pth')
sha256sums=('707b75bf79db7d64d3adc9b8f7d2d07332035da78ef6f202a93376e9dd9779ca'
            'ff9277bcc68ecc10e77d88b6d0a32825ec3c85562095542734ec6212eaaf6d81'
            'e4c76d5872fe22a930ea6b584cbd99c0c7e3a128327b5da43db37117fcf50933'
            '7c22235f0925deba15d4d63e53afcb654c47055bbcd98f56e393ab2584007ed8'
            '468e13ca13a9b43cc0881a9f99083a430e9c0a38abd935431d1c28ee94b26567'
            'bbfd137307a4c7debd5c283b9b0ce539466cee417ac0a155e184d857f9f2899c'
            '2979b33ffafda5d74b6948cd7a5b9a7a62f62b949cef24e95fd15d2883a65220'
            '6d1de9c2944f2ccddca5f5e010ea5ae64a39845a86311af6fdf30841b0a5a16d'
            'a035c768259b98ab1ce0e646312f48b9e1e218197a0f80ac6765e88f8b6ddf28'
            '3d558d8d0e42c20224f13cf5a29c79eba2d59913419f945545d8cf7b72920de2')

package_python-facexlib() {
    optdepends=('facexlib-model: pre-trained model and inference script')
    cd facexlib-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_facexlib-model() {
    pkgdesc="Pre-trained model and interference script for python-facexlib."
    depends=('python-facexlib')
    mkdir -p ${pkgdir}/usr/lib/python3.10/site-packages/facexlib/weights
    cp *.pth ${pkgdir}/usr/lib/python3.10/site-packages/facexlib/weights/
}
